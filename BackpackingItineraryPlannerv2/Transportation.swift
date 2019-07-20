//
//  Transportation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Transportation {
    let duration: Int
    let type: String
    let cost: Double
    let startCity: String
    let endCity: String
    let company: String
    let ticketType: String
    
    init?(duration: Int, type: String, cost: Double, startCity: String, endCity: String, company: String, ticketType: String) {
        
        self.duration = duration
        self.type = type
        self.cost = cost
        self.startCity = startCity
        self.endCity = endCity
        self.company = company
        self.ticketType = ticketType
    }
}
