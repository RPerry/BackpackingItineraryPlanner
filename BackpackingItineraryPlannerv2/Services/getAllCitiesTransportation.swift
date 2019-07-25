//
//  getAllCitiesTransportation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func getAllCitiesTransportation(allCities: Array<Location>, budget: Int) -> Array<Transportation> {
    var cities = [String]()
    for location in allCities {
        cities.append(location.title)
    }
    var tripTransportation = [Transportation]()
    var c1 = 0
    var c2 = 1
    var i = 0
    while i <= (cities.count - 2) {
        
        getTransporation(startCity: cities[c1], endCity: cities[c2], budget: budget, onComplete: {transportation -> Void in
            if let transport = transportation {
                print(transport.company)
                tripTransportation.append(transport)
            }
        })
        c1 += 1
        c2 += 1
        i += 1
    }
    return tripTransportation
}
