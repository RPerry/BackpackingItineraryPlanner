//
//  getTransportation.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getTransporation(startCity: String, endCity: String, budget: Int, onComplete: @escaping (Transportation?) -> Void) -> Void {
    var transportation = Transportation(duration: 0, type: "", cost: 0.0, startCity: "", endCity: "", company: "", ticketType: "")
    var type = ""
    var ticketType = ""
    var company = ""
    var tripDuration = 0
    var price = 0.0
    let spaceLessStartCity = String(startCity.map {
        $0 == " " ? "_" : $0
    })
    
    let spaceLessEndCity = String(endCity.map {
        $0 == " " ? "_" : $0
    })
    
    let key = "YarowbD4"
    Alamofire.request("http://free.rome2rio.com/api/1.4/json/Search?key=\(key)&oName=\(spaceLessStartCity)&dName=\(spaceLessEndCity)&noAir=true&noCar=true&noRideshare=true")
        .responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if budget == 1 && (swiftyJsonVar["routes"][0]["name"] == "Bus" || swiftyJsonVar["routes"][1]["name"] == "Bus") {
                    type = "Bus"
                } else if budget == 1 && (swiftyJsonVar["routes"][0]["name"] != "Bus" && swiftyJsonVar["routes"][1]["name"] != "Bus") {
                    type = "Train"
                } else if (budget == 2 || budget == 3) && (swiftyJsonVar["routes"][0]["name"] == "Train" || swiftyJsonVar["routes"][1]["name"] == "Train")  {
                    type = "Train"
                } else if (budget == 2 || budget == 3) && (swiftyJsonVar["routes"][0]["name"] != "Train" && swiftyJsonVar["routes"][1]["name"] != "Train") {
                    type = "Bus"
                }
               
                if budget == 1 {
                    type = swiftyJsonVar["routes"][0]["name"].rawString()!
                    ticketType = swiftyJsonVar["routes"][0]["indicativePrices"][0]["name"].rawString()!
                    price = swiftyJsonVar["routes"][0]["indicativePrices"][0]["price"].double!
                    tripDuration = swiftyJsonVar["routes"][0]["totalDuration"].int!
                    company = swiftyJsonVar["routes"][0]["segments"][0]["agencies"][0]["links"][0]["displayUrl"].rawString()!.replacingOccurrences(of: ".com", with: "", options: NSString.CompareOptions.literal, range: nil).capitalized
                } else if budget == 2 {
                    type = swiftyJsonVar["routes"][1]["name"].rawString()!
                    ticketType = swiftyJsonVar["routes"][1]["indicativePrices"][0]["name"].rawString()!
                    price = swiftyJsonVar["routes"][1]["indicativePrices"][0]["price"].double!
                    tripDuration = swiftyJsonVar["routes"][1]["totalDuration"].int!
                    company = swiftyJsonVar["routes"][1]["segments"][0]["agencies"][0]["links"][0]["displayUrl"].rawString()!.replacingOccurrences(of: ".com", with: "", options: NSString.CompareOptions.literal, range: nil).capitalized
                } else if budget == 3 {
                    type = swiftyJsonVar["routes"][1]["name"].rawString()!
                    ticketType = swiftyJsonVar["routes"][1]["indicativePrices"][1]["name"].rawString()!
                    price = swiftyJsonVar["routes"][1]["indicativePrices"][1]["price"].double!
                    tripDuration = swiftyJsonVar["routes"][1]["totalDuration"].int!
                    company = swiftyJsonVar["routes"][1]["segments"][0]["agencies"][0]["links"][0]["displayUrl"].rawString()!.replacingOccurrences(of: ".com", with: "", options: NSString.CompareOptions.literal, range: nil).capitalized
                }
                transportation = Transportation(duration: tripDuration, type: type, cost: price, startCity: startCity, endCity: endCity, company: company, ticketType: ticketType)!
                onComplete(transportation)
//                Duration == minutes
                
            }
        }
    
    
}
