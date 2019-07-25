//
//  cityPopulation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/18/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import SwiftyJSON


func cityPopulation(userCity: String) -> Int {
    var population:Int
    guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else { return 2 }
    let url = URL(fileURLWithPath: path)
    
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        guard let array = json as? [Any] else {return 2}
        
        for city in array {
            guard let cityDict = city as? [String: Any] else {return 2}
            let cityName = cityDict["city"] as? String
            let cityPopulation = cityDict["population"] as? String
            if cityName == userCity {
                population = Int(cityPopulation!)!
                return population
            }
        }
    }
    catch {
        print(error)
    }
    return 2
}

