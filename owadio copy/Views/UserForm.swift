//
//  Form.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import Foundation
import SwiftUI

struct UserForm: View {
    @Binding var enlistDate: Date
    @Binding var ordDate: Date
    @State private var isActive = false
    @State private var showAlert = false

    
    var body: some View {
        NavigationView{
            ZStack{
                Color.green.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.3)
                    .foregroundColor(.white)
                
                
                VStack{
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
                    .padding(5)
                    

                    
                    NavigationLink(destination: Homepage().navigationBarBackButtonHidden(true), isActive: $isActive)
                    {Button("Submit") {
                        if enlistDate < ordDate {
                            isActive = true}
                            else {
                                showAlert = true
                            }
                        
                    }
                            .foregroundStyle(.white)
                            .frame(width: 300, height:50)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }
                    
                    .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Invalid Dates"),
                                                message: Text("The enlistment date must be earlier than the ORD date."),
                                                dismissButton: .default(Text("OK"))
                                            )
                                        }
                    
                }
            }
        }
    }
}



#Preview {
    UserForm(enlistDate: .constant(Date()), ordDate: .constant(Date()))
}
    
