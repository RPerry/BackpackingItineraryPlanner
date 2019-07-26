//
//  daysPerCity.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func daysPerCity(cities: Array<Location>, trip: Trip, onComplete: @escaping () -> Void) -> Void{
    
    if trip.duration == trip.cities!.count {
        for city in cities {
            city.duration = 1
        }
    } else {
            for city in cities {
                let pop = cityPopulation(userCity: city.title)
                if pop > 900000 {
                    city.locationSize = 3
                } else if pop > 600000 && pop < 900000 {
                    city.locationSize = 2
                } else {
                    city.locationSize = 1
                }
            }
            
            var cityPoints = 0
            var daysPerPoint = 0.0
            var extraDays = 0.0
            
            for city in cities {
                cityPoints += city.locationSize
            }
            daysPerPoint = Double(trip.duration!) / Double(cityPoints)
            var daysDict: [String: Double] = [:]
            
            for city in cities {
                daysDict[city.title] = Double(city.locationSize) * daysPerPoint
            }
            
            for (city, days) in daysDict {
                if days >= 1 {
                    var overWholeDay = days.truncatingRemainder(dividingBy: 1)
                    extraDays += overWholeDay
                    var newDays = days - overWholeDay
                    daysDict.updateValue(newDays, forKey: city)
                } else if days < 1 {
                    daysDict.updateValue(1.0, forKey: city)
                }
                for location in cities {
                    for (city, days) in daysDict {
                        if location.title == city {
                            location.duration = Int(days)
                        }
                    }
                }
            }
            
            for city in cities {
                if extraDays >= 1.0 {
                    if city.locationSize == 3 {
                        city.duration += 1
                        extraDays -= 1
                    }
                }
            }
            
            for city in cities {
                if extraDays > 1.0 {
                    if city.locationSize == 2 {
                        city.duration += 1
                        extraDays -= 1
                    }
                }
            }
            
            for city in cities {
                if extraDays > 1.0 {
                    if city.locationSize == 3 {
                        city.duration += 1
                        extraDays -= 1
                    }
                }
            }
        }
    onComplete()
}



