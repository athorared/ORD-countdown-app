//
//  Homepage.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import Foundation
import SwiftUI

struct Homepage: View {
    @State private var enlistDate: Date = Date()
    
    @State private var ordDate: Date = Date()
    
    var body: some View {
        TabView{
            VStack{
                CountdownProgress(duration: calculateDuration(), daysLeft: calculateDaysLeft())
                    .padding(100)
                
                
                Text("Days left: \(calculateDaysLeft()) days")
                    .font(.title)
                
                Spacer()
                
            }
            
            .tabItem { Label("Home", systemImage: "house.fill")
            }
            Settings()
                .tabItem { Label("Settings", systemImage: "gear") }
            
        }
    }
    func calculateDaysLeft() -> String {
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: ordDate)
        if let daysLeft = components.day {
            return "\(daysLeft)"
        } else {
            return "Unknown"
        }
    }
    
    // function to calculate total days

    func calculateDuration() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: enlistDate, to: ordDate)
        let days = components.day ?? 1
        return max(days, 1)
    }
}
#Preview {
    Homepage(enlistDate: Date(), ordDate: Calendar.current.date(byAdding: .day, value: 100, to: Date())!)
}
