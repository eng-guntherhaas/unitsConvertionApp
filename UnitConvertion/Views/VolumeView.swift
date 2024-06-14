//
//  VolumeView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct VolumeView: View {
    let volumeUnits = ["Mililiters", "Liters", "Cups", "Pints", "Gallons"]
   
    @State private var selectedUnitInput = "Mililiters"
    @State private var selectedUnitOutput = "Mililiters"
    @State private var volumeInput = 0.0
    @State private var volumeOutput = 0.0

    var body: some View {
        NavigationView{
            Form{
                Section("Enter a value"){
                    TextField("Volume", value: $volumeInput, format: .number)
                    .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitInput) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                .pickerStyle(.menu)
                }
                
                Section("Result"){
                    TextField("Volume", value: $volumeOutput, format: .number)
                    .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitOutput) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                .pickerStyle(.menu)
                }
            }
            .navigationTitle("Volume")
        .onChange(of: volumeInput) {
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
        case "Mililiters":
            switch selectedUnitOutput {
            case "Liters":
                volumeOutput = volumeInput / 1000
            case "Cups":
                volumeOutput = volumeInput / 236.6
            case "Pints":
                volumeOutput = volumeInput / 568.26
            case "Gallons":
                volumeOutput = volumeInput / 3785.41
            default:
                volumeOutput = volumeInput
            }
        case "Liters":
            switch selectedUnitOutput {
            case "Mililiters":
                volumeOutput = volumeInput * 1000
            case "Cups":
                volumeOutput = volumeInput * 4.227
            case "Pints":
                volumeOutput = volumeInput * 1.759
            case "Gallons":
                volumeOutput = volumeInput / 3.785
            default:
                volumeOutput = volumeInput
            }
        case "Cups":
            switch selectedUnitOutput {
            case "Mililiters":
                volumeOutput = volumeInput * 236.6
            case "Liters":
                volumeOutput = volumeInput / 4.227
            case "Pints":
                volumeOutput = volumeInput / 2
            case "Gallons":
                volumeOutput = volumeInput / 15.772
            default:
                volumeOutput = volumeInput
            }
        case "Pints":
            switch selectedUnitOutput {
            case "Mililiters":
                volumeOutput = volumeInput * 568.26
            case "Liters":
                volumeOutput = volumeInput / 1.759
            case "Cups":
                volumeOutput = volumeInput * 2
            case "Gallons":
                volumeOutput = volumeInput / 7.886
            default:
                volumeOutput = volumeInput
            }
        case "Gallons":
            switch selectedUnitOutput {
            case "Mililiters":
                volumeOutput = volumeInput * 3785.41
            case "Liters":
                volumeOutput = volumeInput * 3.785
            case "Cups":
                volumeOutput = volumeInput * 15.772
            case "Pints":
                volumeOutput = volumeInput * 7.886
            default:
                volumeOutput = volumeInput
            }
        default:
            volumeOutput = volumeInput
        }
    }
}

#Preview {
    VolumeView()
}
