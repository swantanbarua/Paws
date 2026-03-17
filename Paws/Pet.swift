//
//  Pet.swift
//  Paws
//
//  Created by Swantan Barua on 26/01/26.
//

// MARK: - IMPORTS
import Foundation
import SwiftData

// MARK: - MODEL
@Model
final class Pet {
    
    // MARK: - PROPERTIES
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    // MARK: - INITIALIZATION
    init(
        name: String,
        photo: Data? = nil
    ) {
        self.name = name
        self.photo = photo
    }
}
