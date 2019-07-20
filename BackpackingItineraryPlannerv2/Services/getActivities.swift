//
//  getActivities.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getActivities(lat: String, long: String, onComplete: @escaping (Array<Activity>) -> Void) -> Void {

    
    
//    Alamofire.request("http://free.rome2rio.com/api/1.4/json/Search?key=\(key)&oName=\(spaceLessStartCity)&dName=\(spaceLessEndCity)&noAir=true&noCar=true&noRideshare=true")
//        .responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                let swiftyJsonVar = JSON(responseData.result.value!)
//                //                print(swiftyJsonVar["routes"][0]["name"])
//                //                print(swiftyJsonVar["routes"][0]["segments"][0]["agencies"][0]["links"][0]["displayUrl"])
//
//                if budget == 1 && (swiftyJsonVar["routes"][0]["name"] == "Bus" || swiftyJsonVar["routes"][1]["name"] == "Bus") {
//                    type = "Bus"
//                } else if budget == 1 && (swiftyJsonVar["routes"][0]["name"] != "Bus" && swiftyJsonVar["routes"][1]["name"] != "Bus") {
//                    type = "Train"
//                } else if (budget == 2 || budget == 3) && (swiftyJsonVar["routes"][0]["name"] == "Train" || swiftyJsonVar["routes"][1]["name"] == "Train")  {
//                    type = "Train"
//                } else if (budget == 2 || budget == 3) && (swiftyJsonVar["routes"][0]["name"] != "Train" && swiftyJsonVar["routes"][1]["name"] != "Train") {
//                    type = "Bus"
//                }
    
    
    
    func getAccessKey() -> String {
        let APIKey = "iUUbifx6sCYU4QIbrNuzJusaGklEb0yB"
        let APISecret = "HAlflmfgef1arXqY"
        let accessKey = ""
        let parameters: [String: String] = [
            "grant_type" : "6ZV05Rji7uNeUAJeGDCzv89Rq6SN5DkR",
            "client_id" : "iosclient",
            "client_secret" : "pvDyKrJUYwXdgcUG",
            ]
        let header = ["Content-Type": "application/x-www-form-urlencoded"]
        
        Alamofire.request("https://test.api.amadeus.com/v1/security/oauth2/token", method: .post, parameters: parameters, headers: header)
                .responseJSON { (responseData) -> Void in
                    if((responseData.result.value) != nil) {
                        let swiftyJsonVar = JSON(responseData.result.value!)
                        print(swiftyJsonVar)
        //                //                print(swiftyJsonVar["routes"][0]["segments"][0]["agencies"][0]["links"][0]["displayUrl"])
        //
                    }
        }
        return accessKey
    }
}
