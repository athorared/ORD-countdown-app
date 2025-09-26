//
//  CalendarView.swift
//  owadio
//
//  Created by Alexander Zhou on 19/11/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date() // Stores the selected date
    @State private var reminders: [Date: [String]] = [:] // Dictionary to hold reminders for each date
    @State private var newReminderText: String = "" // Input for new reminders
    
    var body: some View {
        NavigationView {
            VStack {
                // DatePicker
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                // List of reminders for the selected date
                List {
                    Section(header: Text("Reminders for \(formattedDate(selectedDate))")) {
                        if let remindersForDate = reminders[selectedDate], !remindersForDate.isEmpty {
                            ForEach(remindersForDate, id: \.self) { reminder in
                                Text(reminder)
                            }
                            .onDelete { indexSet in
                                deleteReminder(at: indexSet)
                            }
                        } else {
                            Text("No reminders for this date")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Input for new reminder
                HStack {
                    TextField("Add a new reminder", text: $newReminderText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                    
                    Button(action: addReminder) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .navigationTitle("Calendar & Reminders")
        }
    }
    
    // MARK: - Helper Functions
    
    private func addReminder() {
        guard !newReminderText.isEmpty else { return }
        
        // Add the new reminder to the selected date
        if reminders[selectedDate] != nil {
            reminders[selectedDate]?.append(newReminderText)
        } else {
            reminders[selectedDate] = [newReminderText]
        }
        
        // Clear the text field
        newReminderText = ""
    }
    
    private func deleteReminder(at offsets: IndexSet) {
        if let remindersForDate = reminders[selectedDate] {
            var updatedReminders = remindersForDate
            updatedReminders.remove(atOffsets: offsets)
            reminders[selectedDate] = updatedReminders.isEmpty ? nil : updatedReminders
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    CalendarView()
}
