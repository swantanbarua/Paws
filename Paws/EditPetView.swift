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
        Form {
          TextField(
            "Name",
            text: $pet.name
          )
          .textFieldStyle(.roundedBorder)
          .font(.largeTitle.weight(.light))
          .padding(.vertical)
            
            Button {
                
            } label: {
                Text("SAVE")
                    .font(.title3.weight(.medium))
                    .padding(8)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
            }
            .buttonStyle(.borderedProminent)
            .listRowSeparator(.hidden)
            .padding(.bottom)
        }
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    
    let container = try? ModelContainer(
        for: Pet.self,
        configurations: configuration
    )
    
    if let container {
        let sampleData = Pet(name: "Daisy")
        NavigationStack {
            EditPetView(pet: sampleData)
                .modelContainer(container)
        }
    } else {
        Text("Preview failed to create ModelContainer")
    }
}
