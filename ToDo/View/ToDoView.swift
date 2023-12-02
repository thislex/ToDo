//
//  ToDoView.swift
//  ToDo
//
//  Created by Lexter Tapawan on 02/12/2023.
//

import SwiftUI

struct ToDoView: View {
    // MARK: - PROPERTIES
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        print("Save a new todo item.")
                    }) {
                        Text("Save")
                    } //: SAVE BUTTON
                } //: FORM
                
                Spacer()
            } //: VSTACK
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            })
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    ToDoView()
}
