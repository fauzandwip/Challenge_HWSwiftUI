//
//  ContentView.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitTypeIndex = 0
    
    @State private var sourceUnitIndexes = ArraySlice(repeating: 0, count: UnitTypes.types.count)
    
    @State private var destinationUnitIndexes = ArraySlice(repeating: 0, count: UnitTypes.types.count)
    
    var unitTypes: [UnitType.Type] {
        return UnitTypes.types
    }
    
//    private var output: Double {
//
//        // From Celcius
//        if firstSelectedConversion == "celcius" {
//
//            if secondSelectedConversion == "farenheit" {
//                let farenheitFromCelcius = (input * 9/5) + 32
//                return Double(farenheitFromCelcius)
//            }
//
//            if secondSelectedConversion == "kelvin" {
//                let kelvinFromCelcius = input + 273.15
//                return kelvinFromCelcius
//            }
//        }
//
//        // From Farenheit
//        if firstSelectedConversion == "farenheit" {
//
//            if secondSelectedConversion == "celcius" {
//                let celciusFromFarenheit = (input - 32) * 5/9
//                return Double(celciusFromFarenheit)
//            }
//
//            if secondSelectedConversion == "kelvin" {
//                let kelvinFromFarenheit = (input + 459.67) * 5/9
//                return Double(kelvinFromFarenheit)
//            }
//        }
//
//        // From Kelvin
//        if firstSelectedConversion == "kelvin" {
//
//            if secondSelectedConversion == "celcius" {
//                let celciusFromKelvin = input - 273.15
//                return Double(celciusFromKelvin)
//            }
//
//            if secondSelectedConversion == "farenheit" {
//                let farenheitFromKelvin = (input * 9/5) - 459.67
//                return Double(farenheitFromKelvin)
//            }
//        }
//
//        return input
//    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Conversions", selection: $unitTypeIndex) {
                        ForEach(0..<unitTypes.count, id: \.self) {
                            Text(unitTypes[$0].name)
                        }
                    }
                    .pickerStyle(.segmented)
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
