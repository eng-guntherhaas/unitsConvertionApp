//
//  ContentView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    let optionsForConversion = ["Temperature", "Distance","Time", "Volume"]

    var body: some View {
        NavigationView {
            VStack(spacing: 15){
                ConverterButton(image: "thermometer", text: optionsForConversion[0], destination: TemperatureView())
                ConverterButton(image: "ruler", text: optionsForConversion[1], destination: DistanceView())
                ConverterButton(image: "stopwatch", text: optionsForConversion[2], destination: TimeView())
                ConverterButton(image: "spigot", text: optionsForConversion[3], destination: VolumeView())
            }
           .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
