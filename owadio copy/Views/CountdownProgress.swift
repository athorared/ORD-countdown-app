//
//  countdown.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import Foundation
import SwiftUI

struct CountdownProgress: View {
    var duration: Int
    var daysLeft: String
    var linewidth: CGFloat = 10
    var size: CGFloat = 200
    

    
    var body: some View {
        let numDaysLeft = Double(daysLeft)
        let progress = 1 - ((numDaysLeft ?? 0) / Double(duration))
        ZStack {
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
    }
}

#Preview{
    CountdownProgress(duration: 30, daysLeft: "1")
}


