//
//  ContentView.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import SwiftUI

struct ContentView: View {
    
    /// input value
    @State private var value = "0"
    
    /// selected unit type index
    @State private var unitTypeIndex = 0
    
    /// source indexes
    @State private var sourceUnitIndexes = ArraySlice(repeating: 0, count: UnitTypes.types.count)
    
    /// destination indexes
    @State private var destinationUnitIndexes = ArraySlice(repeating: 0, count: UnitTypes.types.count)
    
    /// all unit types
    var unitTypes: [UnitType.Type] {
        return UnitTypes.types
    }
    
    /// unit type
    var namedUnits: [NamedUnit] {
        return unitTypes[unitTypeIndex].units
    }
    
    /// source unit type
    var sourceNamedUnit: NamedUnit {
        let selectedSourceIndex = sourceUnitIndexes[unitTypeIndex]
        return namedUnits[selectedSourceIndex]
    }
    
    /// destination unit type
    var destinationNamedUnit: NamedUnit {
        let selectedDestinationIndex = destinationUnitIndexes[unitTypeIndex]
        return namedUnits[selectedDestinationIndex]
    }
    
    /// result conversion
    var result: Double {
        let source = Measurement(value: Double(value) ?? 0, unit: sourceNamedUnit.unit)
        return source.converted(to: destinationNamedUnit.unit).value
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
                // unit type picker
                Section {
                    Picker("Unit Conversions", selection: $unitTypeIndex) {
                        ForEach(0..<unitTypes.count, id: \.self) {
                            Text(unitTypes[$0].name)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    // input value
                    HStack {
                        TextField("Value", text: $value)
                            .keyboardType(.decimalPad)
                        Text(sourceNamedUnit.name)
                    }
                    
                    // source type picker
                    Picker("Source", selection: $sourceUnitIndexes[unitTypeIndex]) {
                        ForEach(0..<namedUnits.count, id: \.self) {
                            Text(namedUnits[$0].unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    // output value
                    HStack {
                        Text(result, format: .number)
                        Spacer()
                        Text(destinationNamedUnit.name)
                    }
                    
                    // destination type picker
                    Picker("Destination", selection: $destinationUnitIndexes[unitTypeIndex]) {
                        ForEach(0..<namedUnits.count, id: \.self) {
                            Text(namedUnits[$0].unit.symbol)
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
