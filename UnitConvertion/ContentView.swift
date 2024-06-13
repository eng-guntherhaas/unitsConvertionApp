//
//  ContentView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let distanceUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let volumeUnits = ["Mililiters", "Liters", "Cups", "Pints", "Gallons"]
    
    var body: some View {
        VStack {
            Text("Temperature")
            Text("Distance")
            Text("Volume")
        }
    }
}

#Preview {
    ContentView()
}
