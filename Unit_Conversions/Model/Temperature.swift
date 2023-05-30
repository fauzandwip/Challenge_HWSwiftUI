//
//  Parameter.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import Foundation

struct Temperature: UnitType {
    static var name = "Temperature"
    
    private static let celcius = NamedUnit(name: "Celcius", unit: UnitTemperature.celsius)
    private static let fahrenheit = NamedUnit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)
    private static let kelvin = NamedUnit(name: "Kelvin", unit: UnitTemperature.kelvin)
    
    static let units = [celcius, fahrenheit, kelvin]
}
