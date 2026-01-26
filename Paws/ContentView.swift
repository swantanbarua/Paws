//
//  ContentView.swift
//  Paws
//
//  Created by Swantan Barua on 26/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
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

#Preview {
    ContentView()
        .modelContainer(
            for: Pet.self,
            inMemory: true
        )
}
