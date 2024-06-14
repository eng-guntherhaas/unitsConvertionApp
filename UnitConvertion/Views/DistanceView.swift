//
//  DistanceView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct DistanceView: View {
    let distanceUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    @State private var selectedUnitInput = "Meters"
    @State private var selectedUnitOutput = "Meters"
    @State private var distanceInput = 0.0
    @State private var distanceOutput = 0.0

    var body: some View {
        NavigationView {
            Form{
                Section("Enter a value"){
                    TextField("Distance", value: $distanceInput, format: .number)
                       .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitInput) {
                        ForEach(distanceUnits, id: \.self) {
                            Text($0)
                        }
                    }
                   .pickerStyle(.menu)
                }
                
                Section("Result"){
                    TextField("Distance", value: $distanceOutput, format: .number)
                       .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitOutput) {
                        ForEach(distanceUnits, id: \.self) {
                            Text($0)
                        }
                    }
                   .pickerStyle(.menu)
                }
            }
            .navigationTitle("Distance Converter")
           .onChange(of: distanceInput) {
                calculateConvertion()
            }
           .onChange(of: selectedUnitInput) {
                calculateConvertion()
            }
           .onChange(of: selectedUnitOutput) {
                calculateConvertion()
       }
        }
    }

    func calculateConvertion(){
        switch selectedUnitInput {
        case "Meters":
            switch selectedUnitOutput {
            case "Kilometers":
                distanceOutput = distanceInput / 1000
            case "Feet":
                distanceOutput = distanceInput * 3.28084
            case "Yards":
                distanceOutput = distanceInput * 1.09361
            case "Miles":
                distanceOutput = distanceInput / 1609.34
            default:
                distanceOutput = distanceInput
            }
        case "Kilometers":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput * 1000
            case "Feet":
                distanceOutput = distanceInput * 3280.84
            case "Yards":
                distanceOutput = distanceInput * 1093.61
            case "Miles":
                distanceOutput = distanceInput / 1.60934
            default:
                distanceOutput = distanceInput
            }
        case "Feet":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput / 3.28084
            case "Kilometers":
                distanceOutput = distanceInput / 3280.84
            case "Yards":
                distanceOutput = distanceInput / 3
            case "Miles":
                distanceOutput = distanceInput / 5380
            default:
                distanceOutput = distanceInput
            }
        case "Yards":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput / 1.09361
            case "Kilometers":
                distanceOutput = distanceInput / 1093.61
            case "Feet":
                distanceOutput = distanceInput * 3
            case "Miles":
                distanceOutput = distanceInput / 1760
            default:
                distanceOutput = distanceInput
            }
        case "Miles":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput * 1609.34
            case "Kilometers":
                distanceOutput = distanceInput * 1.60934
            case "Feet":
                distanceOutput = distanceInput * 5380
            case "Yards":
                distanceOutput = distanceInput * 1760
            default:
                distanceOutput = distanceInput
            }
        default:
            distanceOutput = distanceInput
        }
    }
}

#Preview {
    DistanceView()
}
