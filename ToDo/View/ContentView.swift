//
//  ContentView.swift
//  ToDo
//
//  Created by Lexter Tapawan on 02/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - FUNCTIONS
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationSplitView {
            List(0..<5) { item in
                Text("Hello World!")
            } //: LIST
            
            
            //                ForEach(items) { item in
            //                    NavigationLink {
            //                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
            //                    } label: {
            //                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
            //                    }
            //                }
            
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        self.showingAddTodoView.toggle()
                    }) {
                        Image(systemName: "plus")
                    } //: ADD BUTTON
                    .sheet(isPresented: $showingAddTodoView) {
                        ToDoView()
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
