//
//  TimeView.swift
//  UnitConvertion
//
//  Created by Gunther Masi Haas on 14/06/2024.
//

import SwiftUI

import SwiftUI

struct TimeView: View {
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    @State private var selectedUnitInput = "Seconds"
    @State private var selectedUnitOutput = "Seconds"
    @State private var timeInput = 0.0
    @State private var timeOutput = 0.0

    var body: some View {
        NavigationView {
            Form{
                Section("Enter a value"){
                    TextField("Time", value: $timeInput, format: .number)
                      .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitInput) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                  .pickerStyle(.menu)
                }
                
                Section("Result"){
                    TextField("Time", value: $timeOutput, format: .number)
                      .keyboardType(.decimalPad)
                    Picker("Select Unit", selection: $selectedUnitOutput) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                  .pickerStyle(.menu)
                }
            }
          .navigationTitle("Time Converter")
        }
      .onChange(of: timeInput) {
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
        case "Seconds":
            switch selectedUnitOutput {
            case "Minutes":
                timeOutput = timeInput / 60
            case "Hours":
                timeOutput = timeInput / 3600
            case "Days":
                timeOutput = timeInput / 86400
            default:
                timeOutput = timeInput
            }
        case "Minutes":
            switch selectedUnitOutput {
            case "Seconds":
                timeOutput = timeInput * 60
            case "Hours":
                timeOutput = timeInput / 60
            case "Days":
                timeOutput = timeInput / 1440
            default:
                timeOutput = timeInput
            }
        case "Hours":
            switch selectedUnitOutput {
            case "Seconds":
                timeOutput = timeInput * 3600
            case "Minutes":
                timeOutput = timeInput * 60
            case "Days":
                timeOutput = timeInput / 24
            default:
                timeOutput = timeInput
            }
        case "Days":
            switch selectedUnitOutput {
            case "Seconds":
                timeOutput = timeInput * 86400
            case "Minutes":
                timeOutput = timeInput * 1440
            case "Hours":
                timeOutput = timeInput * 24
            default:
                timeOutput = timeInput
            }
        default:
            timeOutput = timeInput
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
#Preview {
    TimeView()
}
