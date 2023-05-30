//
//  ContentView.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import SwiftUI

struct ContentView: View {
    private let unitConversions = ["temperatures", "lengths", "times", "volumes"]
    private let temperatures = ["celcius", "farenheit", "kelvin"]
    private let lengths = ["meters", "kilometers", "feet", "yards", "miles"]
    private let times = ["seconds", "minutes", "hours", "days"]
    private let volumes = ["mililiters", "liters", "cups", "pints", "gallons"]
    
    @State private var selectedConversions = "temperatures"
    @State private var firstSelectedConversion = "celcius"
    @State private var secondSelectedConversion = "farenheit"
    
    @State private var input = 0.0
    private var output: Double {
        
        // From Celcius
        if firstSelectedConversion == "celcius" {
            
            if secondSelectedConversion == "farenheit" {
                let farenheitFromCelcius = (input * 9/5) + 32
                return Double(farenheitFromCelcius)
            }
            
            if secondSelectedConversion == "kelvin" {
                let kelvinFromCelcius = input + 273.15
                return kelvinFromCelcius
            }
        }
        
        // From Farenheit
        if firstSelectedConversion == "farenheit" {
            
            if secondSelectedConversion == "celcius" {
                let celciusFromFarenheit = (input - 32) * 5/9
                return Double(celciusFromFarenheit)
            }
            
            if secondSelectedConversion == "kelvin" {
                let kelvinFromFarenheit = (input + 459.67) * 5/9
                return Double(kelvinFromFarenheit)
            }
        }
        
        // From Kelvin
        if firstSelectedConversion == "kelvin" {
            
            if secondSelectedConversion == "celcius" {
                let celciusFromKelvin = input - 273.15
                return Double(celciusFromKelvin)
            }
            
            if secondSelectedConversion == "farenheit" {
                let farenheitFromKelvin = (input * 9/5) - 459.67
                return Double(farenheitFromKelvin)
            }
        }
        
        return input
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Conversions", selection: $selectedConversions) {
                        ForEach(unitConversions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Picker("From", selection: $firstSelectedConversion) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("To", selection: $secondSelectedConversion) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("input", value: $input, format: .number)
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text(output, format: .number)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Unit Conversions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
