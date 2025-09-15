//
//  EditPetView.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

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
                        .resizable()
                        .scaledToFit()
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .circular
                            )
                        )
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: 300
                        )
                        .padding(.top)
                }
            } else {
                CustomContentUnavailableView(
                    icon: "pawprint.circle",
                    title: "No Photo",
                    description: "Add a photo of your favourite pet to make it easier to find them"
                )
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
            .listRowSeparator(.hidden)
            
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
        .onChange(of: photosPickerItem) {
            Task {
                pet.photo = try? await photosPickerItem?.loadTransferable(type: Data.self)
            }
        }
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
