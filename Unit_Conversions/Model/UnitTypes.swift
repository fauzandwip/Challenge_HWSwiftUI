//
//  UnitTypes.swift
//  Unit_Conversions
//
//  Created by Fauzan Dwi Prasetyo on 30/05/23.
//

import Foundation

protocol UnitType {
    static var name: String { get }
    static var units: [NamedUnit] { get }
}

struct UnitTypes {
    static let types: [UnitType.Type] = [Temperature.self, Length.self, Time.self, Volume.self]
}
