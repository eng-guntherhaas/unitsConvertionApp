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
        Form{
            Section("Enter a value"){
                TextField("Distance", value: $distanceInput, formatter: NumberFormatter())
                   .keyboardType(.decimalPad)
                Picker("Select Unit", selection: $distanceInput) {
                    ForEach(distanceUnits, id: \.self) {
                        Text($0)
                    }
                }
               .pickerStyle(.menu)
            }
            
            Section("Result"){
                TextField("Distance", value: $distanceOutput, formatter: NumberFormatter())
                   .keyboardType(.decimalPad)
                Picker("Select Unit", selection: $distanceOutput) {
                    ForEach(distanceUnits, id: \.self) {
                        Text($0)
                    }
                }
               .pickerStyle(.menu)
            }
        }
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

    func calculateConvertion(){
        switch selectedUnitInput {
        case "Meters":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput
            case "Kilometers":
                distanceOutput = distanceInput
            case "Feet":
                distanceOutput = distanceInput
            case "Yards":
                distanceOutput = distanceInput
            case "Miles":
                distanceOutput = distanceInput
            default:
                distanceOutput = distanceInput
            }
        case "Kilometers":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput
            case "Feet":
                distanceOutput = distanceInput
            case "Yards":
                distanceOutput = distanceInput
            case "Miles":
                distanceOutput = distanceInput
            default:
                distanceOutput = distanceInput
            }
        case "Feet":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput
            case "Kilometers":
                distanceOutput = distanceInput
            case "Yards":
                distanceOutput = distanceInput
            case "Miles":
                distanceOutput = distanceInput
            default:
                distanceOutput = distanceInput
            }
        case "Yards":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput
            case "Kilometers":
                distanceOutput = distanceInput
            case "Feet":
                distanceOutput = distanceInput
            case "Miles":
                distanceOutput = distanceInput
            default:
                distanceOutput = distanceInput
            }
        case "Miles":
            switch selectedUnitOutput {
            case "Meters":
                distanceOutput = distanceInput
            case "Kilometers":
                distanceOutput = distanceInput
            case "Feet":
                distanceOutput = distanceInput
            case "Yards":
                distanceOutput = distanceInput
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
