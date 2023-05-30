//
//  Volume.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import Foundation

struct Volume: UnitType {
    static var name = "Volume"
    
    private static let mililiters = NamedUnit(name: "Mililiters", unit: UnitVolume.milliliters)
    private static let liters = NamedUnit(name: "Liters", unit: UnitVolume.liters)
    private static let cups = NamedUnit(name: "Cups", unit: UnitVolume.cups)
    private static let pints = NamedUnit(name: "Pints", unit: UnitVolume.pints)
    private static let gallons = NamedUnit(name: "Gallons", unit: UnitVolume.gallons)
    
    static let units: [NamedUnit] = [mililiters, liters, cups, pints, gallons]
}
