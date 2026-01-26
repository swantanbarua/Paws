//
//  EditPetView.swift
//  Paws
//
//  Created by Swantan Barua on 26/01/26.
//

// MARK: - IMPORTS
import SwiftUI
import SwiftData

struct EditPetView: View {
    
    // MARK: - PROPERTIES
    @Bindable var pet: Pet
    
    // MARK: - BODY
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = ModelContainer(
                for: Pet.self,
                configuration: configuration
            )
            let sampleData = Pet(name: "Daisy")
            
            return EditPetView()
                .modelContainer(container)
        } catch {
            fatalError("Could not load preview data \(error.localizedDescription)")
        }
    }
}
