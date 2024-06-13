//
//  ContentView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    let optionsForConversion = ["Temperature", "Distance", "Volume"]

    var body: some View {
        NavigationView {
            VStack {
                ConverterButton(image: "thermometer", text: optionsForConversion[0], destination: TemperatureView())
                ConverterButton(image: "ruler", text: optionsForConversion[1], destination: DistanceView())
                ConverterButton(image: "spigot", text: optionsForConversion[2], destination: VolumeView())
            }
           .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
