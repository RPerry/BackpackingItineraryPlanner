//
//  Hotel.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/18/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Hotel {
    var name: String?
    var checkIn: Date?
    var checkOut: Date?
    var cost: Double?
    var lat: Double?
    var long: Double?
    
    init?(name: String?, checkIn: Date?, checkOut: Date?, cost: Double?, lat: Double?, long: Double?) {
       
        self.name = name
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.cost = cost
        self.lat = lat
        self.long = long
    }
}
