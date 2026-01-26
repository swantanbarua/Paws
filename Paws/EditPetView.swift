//
//  EditPetView.swift
//  Paws
//
//  Created by Swantan Barua on 26/01/26.
//

// MARK: - IMPORTS
import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    
    // MARK: - PROPERTIES
    @Bindable var pet: Pet
    @State private var photosPickerItem: PhotosPickerItem?
    
    // MARK: - BODY
    var body: some View {
        Form {
            if let imageData = pet.photo {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                }
            } else {
                CustomContentUnavailableView(
                    icon: "pawprint.circle",
                    title: "No Photo",
                    description: "Add a photo of your favourite pet to make it easier to find them"
                )
                .padding(.top)
            }
            
            PhotosPicker(
                selection: $photosPickerItem,
                matching: .images
            ) {
              Label(
                "Select a photo",
                systemImage: "photo.badge.plus"
              )
              .frame(
                minWidth: 0,
                maxWidth: .infinity
              )
            }
            
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
