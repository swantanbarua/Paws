//
//  Pet.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

import Foundation
import SwiftData

@Model final class Pet {
    
    // MARK: - PROPERTIES
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    // MARK: - INIT
    init(
        name: String,
        photo: Data? = nil
    ) {
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preview: ModelContainer {
        
        // MARK: - PROPERTIES
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(
            for: Pet.self,
            configurations: configuration
        )
        
        container.mainContext.insert(
            Pet(name: "Euro")
        )
        container.mainContext.insert(
            Pet(name: "Bella")
        )
        container.mainContext.insert(
            Pet(name: "Charlie")
        )
        container.mainContext.insert(
            Pet(name: "Daisy")
        )
        container.mainContext.insert(
            Pet(name: "Luna")
        )
        container.mainContext.insert(
            Pet(name: "Robert")
        )
        container.mainContext.insert(
            Pet(name: "Roxy")
        )
        container.mainContext.insert(
            Pet(name: "Loki")
        )
        
        return container
    }
}
