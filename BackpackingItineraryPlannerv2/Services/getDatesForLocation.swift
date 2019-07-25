//
//  datesForLocation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/25/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func getDatesForLocations(cities: Array<Location>, tripStartDate: Date, tripEndDate: Date) -> Void {
    
    for city in cities {
        print("dates for locations cities")
        print(city.title)
    }
    
    
    var i = 0
    
    while i < cities.count {
        if i == 0 {
            cities[0].startDate = tripStartDate
            
            if cities[0].duration == 1 {
                cities[0].endDate = tripStartDate
            } else {
                let calendar = Calendar.current
                let endDate = calendar.date(byAdding: .day, value: cities[0].duration - 1, to: tripStartDate)
                cities[0].endDate = endDate
            }
            i += 1
        } else {
            print(cities[i].title)
            let calendar = Calendar.current
            let startDate = calendar.date(byAdding: .day, value: 1, to: cities[i-1].endDate!)
            cities[i].startDate = startDate

            if cities[i].duration == 1 {
                cities[i].endDate = cities[i].startDate
            } else {
                let endDate = calendar.date(byAdding: .day, value: cities[i].duration - 1, to: cities[i].startDate!)
                cities[i].endDate = endDate
            }
            i += 1
        }
    }
}

