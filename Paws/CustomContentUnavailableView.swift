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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomContentUnavailableView(
        icon: "cat.circle",
        title: "No Photo",
        description: "Add a photo to get started"
    )
}
