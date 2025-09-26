//
//  Homepage.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import Foundation
import SwiftUI

struct Homepage: View {
    @Binding var enlistDate: Date
    @Binding var ordDate: Date
    
    var body: some View {
        TabView{
            VStack{
                Text("Home")
                    .font(.largeTitle.bold())
                CountdownProgress(enlistDate: $enlistDate, ordDate: $ordDate)
                    
                
                Spacer()
                
            }
            
            .tabItem { Label("Home", systemImage: "house.fill")
            }
            Settings(enlistDate: $enlistDate, ordDate: $ordDate)
                .tabItem { Label("Settings", systemImage: "gear") }
            CalendarView()
                .tabItem{ Label("Calendar", systemImage: "calendar")}
            
        }
    }
}
#Preview {
    Homepage(enlistDate: .constant(Date()), ordDate: .constant(Date()))
}
