//
//  EditPetView.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

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
                configurations: configuration
            )
            let sampleData = Pet(name: "Euro")
            
            return EditPetView(pet: sampleData)
                .modelContainer(container)
        } catch {
            fatalError("Could not load preview data : \(error.localizedDescription)")
        }
    }
}
