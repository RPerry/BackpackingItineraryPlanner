//
//  cityPopulation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/18/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import SwiftyJSON


func cityPopulation(userCity: String) -> Double? {
    var population:Double
    guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else { return 2 }
    let url = URL(fileURLWithPath: path)
    
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        guard let array = json as? [Any] else {return 2}
        
        for city in array {
            guard let cityDict = city as? [String: Any] else {return 2}
            let cityName = cityDict["city"] as? String
//            print(cityName)
            let cityPopulation = cityDict["population"] as? String
            if cityName == userCity {
                population = Double(cityPopulation!) as! Double
                print(population)
                return population
            }
        }
    }
    catch {
        print(error)
    }
    return 2
}

