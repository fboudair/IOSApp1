//
//  CoffeeOrder.swift
//  CoffeeOrder2
//
//  Created by Louise Rennick on 2025-01-30.
//

import Foundation
import SwiftUI
import SwiftData

// Coffee Order Model

@Model

class CoffeeOrder: Identifiable {
    var id: UUID = UUID()
    var name: String
    var coffeeSize: String
    var coffeeType: String
    var addOns: [String]
    var specialRequest: String
    
    init(name: String, coffeeSize: String, coffeeType: String, addOns: [String], specialRequest: String) {
        self.name = name
        self.coffeeSize = coffeeSize
        self.coffeeType = coffeeType
        self.addOns = addOns
        self.specialRequest = specialRequest
       
    }
    
    
}
