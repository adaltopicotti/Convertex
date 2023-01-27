//
//  ContentView.swift
//  Convertex
//
//  Created by Adalto Picotti Junior on 27/01/23.
//

import SwiftUI


struct ContentView: View {
    @State var inputValue = 0.0
    @State var temperatureUnitInput = "Celsius"
    @State var temperatureUnitOutput = "Fahrenheit"
    var outputValue: Double {
        let tempInput = inputValue
        var tempOutput = 0.0
        
        
        if temperatureUnitInput == "Celsius" && temperatureUnitOutput == "Fahrenheit" {
            tempOutput = tempInput * 1.8 + 32
        }
        if temperatureUnitInput == "Celsius" && temperatureUnitOutput == "Kelvin" {
            tempOutput = tempInput + 273
        }
        
        if temperatureUnitInput == "Fahrenheit" && temperatureUnitOutput == "Celsius" {
            tempOutput = (tempInput - 32) / 1.8
        }
        if temperatureUnitInput == "Fahrenheit" && temperatureUnitOutput == "Kelvin" {
            tempOutput = (tempInput - 32) * 5/9 + 273
        }
        
        if temperatureUnitInput == "Kelvin" && temperatureUnitOutput == "Celsius" {
            tempOutput = tempInput - 273
        }
        if temperatureUnitInput == "Kelvin" && temperatureUnitOutput == "Fahrenheit" {
            tempOutput = (tempInput - 273) * 1.8 + 32
        }
        
        if temperatureUnitInput == temperatureUnitOutput {
            tempOutput = tempInput
        }
        return tempOutput
    }
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From", selection: $temperatureUnitInput) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Input", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    
                } header: {
                    Text("Convert")
                }
                Section {
                    Picker("To", selection: $temperatureUnitOutput) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputValue.formatted()) \(temperatureUnitOutput)")
                } header: {
                    Text("To")
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
