//
//  Webservice.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/9/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


func getCityLatAndLong(city: String, countryCode: String, onComplete: @escaping (Location?) -> Void) -> Void {
    
    let key = "afb663abaaf84977bab22a7e02174cd1"
    Alamofire.request("https://api.opencagedata.com/geocode/v1/json?q=\(city)&key=\(key)&countrycode=\(countryCode)")
    .responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
//                    print(swiftyJsonVar)
//                print(swiftyJsonVar["results"][0]["geometry"]["lat"])
                //print(swiftyJsonVar["results"][0]["geometry"]["lng"])
                let lat = swiftyJsonVar["results"][0]["geometry"]["lat"].double
                let long = swiftyJsonVar["results"][0]["geometry"]["lng"].double
                let location = Location(title: city, latitude: lat ?? 0 , longitude: long ?? 0)
                
                onComplete(location)
            }
        }
}
    
