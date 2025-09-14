//
//  ContentView.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                EmptyView()
            }
        }
    }
}

#Preview("No Data") {
    ContentView()
        .modelContainer(
            for: Pet.self,
            inMemory: true
        )
}
