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
    
    // MARK: - BODY
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        do {
            return EditPetView()
        } catch {
            fatalError("Could not load preview data : \(error.localizedDescription)")
        }
    }
}
