//
//  Settings.swift
//  owadio
//
//  Created by Alexander Zhou on 3/9/24.
//

import Foundation
import SwiftUI

struct Settings: View {
    
    @Binding var enlistDate: Date
    @Binding var ordDate: Date
    
    var body: some View {
        VStack {
            Section(header: Text("Setup").font(.largeTitle).bold()) {
                DatePicker("Enlistment date:", selection: $enlistDate, displayedComponents: .date)
                    .padding(15)
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                
                
                DatePicker("ORD Date:", selection: $ordDate, displayedComponents: .date)
                    .padding(15)
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
        }
    }
}
    
    #Preview{
        Settings()
    }
