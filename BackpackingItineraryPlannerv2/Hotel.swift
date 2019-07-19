//
//  Hotel.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/18/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Hotel {
    let name: String
    let checkIn: Double
    let checkOut: Double
    let cost: Double
    let city: String
    let website: String
    
    init?(name: String, checkIn: Double, checkOut: Double, cost: Double, city: String, website: String) {
       
        self.name = name
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.cost = cost
        self.city = city
        self.website = website
    }
}
