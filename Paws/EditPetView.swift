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
    NavigationStack {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(
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
