//
//  daysPerCity.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func daysPerCity(cities: Array<Location>, trip: Trip) -> Dictionary<String, Int> {
    var userCitiesPopulation: [String:Double] = [:]
    var numberofBigCities = 0
    var numberofMidCities = 0
    var numberofSmallCities = 0
    var dayCityDict: [String:Int] = [:]
    
    if trip.duration == trip.cities!.count {
        for city in cities {
            dayCityDict[city.title] = 1
        }
        return dayCityDict
    }
    
    
    for city in cities {
        userCitiesPopulation[city.title] = cityPopulation(userCity: city.title)
    }
    
    for (city, pop) in userCitiesPopulation {
       if pop > 900000 {
            numberofBigCities += 1
       }
       else if pop > 600000 && pop < 900000 {
            numberofMidCities += 1
       } else {
            numberofSmallCities += 1
        }
    }
    
    if numberofSmallCities == 0 && numberofMidCities == 0 {
        let days = trip.duration! / numberofBigCities
        for city in cities {
            dayCityDict[city.title] = days
        }
    } else if numberofBigCities == 0 && numberofSmallCities == 0 {
        let days = trip.duration! / numberofMidCities
        for city in cities {
            dayCityDict[city.title] = days
        }
    } else if numberofBigCities == 0 && numberofMidCities == 0 {
        let days = trip.duration! / numberofSmallCities
        for city in cities {
            dayCityDict[city.title] = days
        }
//    } else if {
        
    }
    
    
    
    

    return dayCityDict
}
