//
//  countdown.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import Foundation
import SwiftUI

struct CountdownProgress: View {
    @Binding var enlistDate: Date
    @Binding var ordDate: Date
    @State private var showConfetti = false
    var linewidth: CGFloat = 15
    var size: CGFloat = 300

    var body: some View {
        let duration = Double(calculateDuration())
        let daysLeft = Double(calculateDaysLeft())
        let progress = 1 - (daysLeft / duration)

        ZStack {
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(width: 400, height: 400)
                .cornerRadius(20)
            Circle()
                .stroke(Color.blue.opacity(0.2), lineWidth: linewidth)
                .frame(width: size, height: size)

            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: linewidth, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: size, height: size)

            Text(String(format: "%.0f%%", min(progress, 1.0) * 100))
                .font(.largeTitle)
                .bold()
        }
        .padding(-9)
        .onChange(of: calculateDaysLeft()) { daysLeft in
            if daysLeft == 0 && !showConfetti {
                showConfetti = true
            }
        } // Automatically called when the value changes
    
        ZStack {
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(width: 400, height: 100)
                .cornerRadius(20)
            
            Text("Days left: \(calculateDaysLeft())")
                .font(.title)
        }
        
        if showConfetti {
            ConfettiView()
                .edgesIgnoringSafeArea(.all)
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        showConfetti = false
                    }
                }
        }
        
        if daysLeft == 0 {
            Text("owadio!")
                .font(.title)
                .bold()
        }
    }

    // MARK: - Helper Functions
    func calculateDaysLeft() -> Int {
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: ordDate)
        return components.day ?? 0
    }

    func calculateDuration() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: enlistDate, to: ordDate)
        return max(components.day ?? 1, 1)
    }
}

#Preview {
    CountdownProgress(enlistDate: .constant(Date()), ordDate: .constant(Date()))
}
