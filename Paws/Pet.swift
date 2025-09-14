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
