//
//  getHotel.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/23/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getHotel(city: String, checkinDate: Date, checkoutDate: Date, locationSize: Int, budget: Int) -> Hotel {
    let apiKey = googlePlacesAPIKey
    var location = ""
    var hotel = Hotel(name: nil, checkIn: checkinDate, checkOut: checkoutDate, cost: nil, lat: nil, long: nil)
    
    location = String(city.map {
        $0 == " " ? "+" : $0
    })
    
    Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=low+priced+hotels+in+downtown+\(location)&key=\(apiKey)")
        .responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                let name = swiftyJsonVar["results"][0]["name"].rawString()
                let lat = swiftyJsonVar["results"][0]["geometry"]["location"]["lat"].rawString()
                let long = swiftyJsonVar["results"][0]["geometry"]["location"]["lng"].rawString()
                var cost = 0.0
                
                
                let cityCostDict3 = [
                    1: [56.00, 75.00, 63.00, 68.00],
                    2: [84.00, 96.00, 102.00, 105.00],
                    3: [120.00, 138.00, 164.00, 143.00]
                ]
                
                let cityCostDict2 = [
                    1: [50.00, 62.00, 43.00, 40.00],
                    2: [56.00, 75.00, 63.00, 68.00],
                    3: [84.00, 96.00, 102.00, 105.00]
                ]
                let cityCostDict1 = [
                    1: [38.00, 34.00, 43.00, 39.00],
                    2: [50.00, 62.00, 43.00, 40.00],
                    3: [76.00, 75.00, 63.00, 68.00]
                ]
                
                if locationSize == 3 {
                    if budget == 1 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict3[1]![randomNumber]
                    } else if budget == 2 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict3[2]![randomNumber]
                    } else {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict3[3]![randomNumber]
                    }
                } else if locationSize == 2 {
                    if budget == 1 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict2[1]![randomNumber]
                    } else if budget == 2 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict2[2]![randomNumber]
                    } else {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict2[3]![randomNumber]
                    }
                } else {
                    if budget == 1 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict1[1]![randomNumber]
                    } else if budget == 2 {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict1[2]![randomNumber]
                    } else {
                        let randomNumber = Int.random(in: 0..<4)
                        cost = cityCostDict1[3]![randomNumber]
                    }
                }
                
                hotel!.name = name
                hotel!.cost = cost
                hotel!.lat = lat
                hotel!.long = long
            }
    }
    return(hotel!)
}

