//
//  PawsApp.swift
//  Paws
//
//  Created by Swantan Barua on 26/01/26.
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
