//
//  CustomContentUnavailableView.swift
//  Paws
//
//  Created by Swantan Barua on 14/09/25.
//

import SwiftUI

struct CustomContentUnavailableView: View {
    
    // MARK: - PROPERTIES
    var icon: String
    var title: String
    var description: String
    
    // MARK: - BODY
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    CustomContentUnavailableView(
        icon: "cat.circle",
        title: "No Photo",
        description: "Add a photo to get started"
    )
}
