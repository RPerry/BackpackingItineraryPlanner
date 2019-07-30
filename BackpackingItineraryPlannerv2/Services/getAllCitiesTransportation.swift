//
//  getAllCitiesTransportation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func getAllCitiesTransportation(trip: Trip, allCities: Array<Location>, budget: Int, onComplete: @escaping () -> Void) -> Void {
    var cities = [String]()
    for location in allCities {
        cities.append(location.title)
    }
    var tripTransportation = [Transportation]()
    var c1 = 0
    var c2 = 1
    var i = 0
    var j = 0
    while i <= (cities.count - 2) {
        
        getTransporation(startCity: cities[c1], endCity: cities[c2], budget: budget, onComplete: {transportation -> Void in
            if let transport = transportation {
                print(transport.company)
                print(transport.startCity)
                tripTransportation.append(transport)
//                print("Trip transportation count: \(tripTransportation.count)")
            j += 1
            if j == cities.count - 1 {
                trip.transportation = tripTransportation
                onComplete()
            }
            }
        })
        c1 += 1
        c2 += 1
        i += 1
    }
}
