//
//  ContentView.swift
//  owadio
//
//  Created by Alexander Zhou on 31/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var enlistDate: Date = Date()
    @State private var ordDate: Date = Date()
    @State private var isFormCompleted = false

    var body: some View {
        if isFormCompleted {
            Homepage(enlistDate: $enlistDate, ordDate: $ordDate)
        } else {
            UserForm(enlistDate: $enlistDate, ordDate: $ordDate, isFormCompleted: $isFormCompleted)
        }
    }
}

#Preview {
    ContentView()
}
