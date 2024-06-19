//
//  ConverterButton.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct ConverterButton<Destination: View>: View {
    let image: String
    let text: String
    @ViewBuilder let destination: Destination

    init(image: String, text: String, destination: Destination) {
        self.image = image
        self.text = text
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: image)
                  .imageScale(.large)
                Text(text)
            }
            .frame(width: 150, height: 50)
            .padding(20)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
        }
    }
}

#Preview {
    ConverterButton(image: "gear", text: "Placeholder", destination: VolumeView())
}
