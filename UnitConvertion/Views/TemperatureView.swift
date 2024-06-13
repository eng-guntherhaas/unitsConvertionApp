//
//  TemperatureView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 13/06/2024.
//

import SwiftUI

struct TemperatureView: View {
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedUnitInput = "Celsius"
    @State private var selectedUnitOutput = "Celsius"
    @State private var temperatureInput = 0.0
    @State private var temperatureOutput = 0.0

    var body: some View {
        Form{
            Section("Enter a value"){
                TextField("Temperature", value: $temperatureInput, formatter: NumberFormatter())
                   .keyboardType(.decimalPad)
                Picker("Select Unit", selection: $selectedUnitInput) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }
               .pickerStyle(.menu)
            }
            
            Section("Result"){
                TextField("Temperature", value: $temperatureOutput, formatter: NumberFormatter())
                   .keyboardType(.decimalPad)
                Picker("Select Unit", selection: $selectedUnitOutput) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }
               .pickerStyle(.menu)
            }
        }
       .onChange(of: temperatureInput) {
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
        case "Celsius":
            switch selectedUnitOutput {
            case "Fahrenheit":
                temperatureOutput = (temperatureInput * 9 / 5) + 32
            case "Kelvin":
                temperatureOutput = temperatureInput + 273.15
            default:
                temperatureOutput = temperatureInput
            }
        case "Fahrenheit":
            switch selectedUnitOutput {
            case "Celsius":
                temperatureOutput = (temperatureInput - 32) * 5/9
            case "Kelvin":
                temperatureOutput = (temperatureInput - 32) * 5/9 + 273.15
            default:
                temperatureOutput = temperatureInput
            }
        case "Kelvin":
            switch selectedUnitOutput {
            case "Celsius":
                temperatureOutput = temperatureInput - 273.15
            case "Fahrenheit":
                temperatureOutput = (temperatureInput - 273.15) * 9/5 + 32
            default:
                temperatureOutput = temperatureInput
            }
        default:
            temperatureOutput = temperatureInput
        }
    }
}
#Preview {
    TemperatureView()
}
