//
//  Length.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import Foundation

struct Length: UnitType {
    static var name = "Length"
    
    private static let meters = NamedUnit(name: "Meters", unit: UnitLength.meters)
    private static let kilometer = NamedUnit(name: "Kilometers", unit: UnitLength.kilometers)
    private static let feet = NamedUnit(name: "Feet", unit: UnitLength.feet)
    private static let yards = NamedUnit(name: "Yards", unit: UnitLength.yards)
    private static let miles = NamedUnit(name: "Miles", unit: UnitLength.miles)
    
    static let units: [NamedUnit] = [meters, kilometer, feet, yards, miles]
}
