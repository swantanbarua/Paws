//
//  PawsApp.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
