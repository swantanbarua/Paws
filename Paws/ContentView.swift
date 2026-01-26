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
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    @State private var path = [Pet]()
    
    func addPet() {
        let pet = Pet(name: "Best Friend")
        modelContext.insert(pet)
        path = [pet]
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: layout) {
                    GridRow {
                        ForEach(pets) { pet in
                            NavigationLink(value: pet) {
                                VStack {
                                    
                                    if let imageData = pet.photo {
                                        if let image = UIImage(data: imageData) {
                                            Image(uiImage: image)
                                        }
                                    } else {
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.quaternary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                    
                                    Spacer()
                                }
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 0,
                                    maxHeight: .infinity
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 8,
                                        style: .circular
                                    )
                                )
                            }
                            .foregroundStyle(.primary)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(
                pets.isEmpty ? "" : "Pets"
            )
            .navigationDestination(
                for: Pet.self,
                destination: EditPetView.init
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                      addPet()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavailableView(
                        icon: "dog.circle",
                        title: "No Pets",
                        description: "Add a new pet to get started"
                    )
                }
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
