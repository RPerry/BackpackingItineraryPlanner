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


func getCityLatAndLong(city: String, title: String, countryCode: String, onComplete: @escaping (Location?) -> Void) -> Void {
    
    let key = latLongAPIKey
    Alamofire.request("https://api.opencagedata.com/geocode/v1/json?q=\(city)&key=\(key)&countrycode=\(countryCode)")
    .responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let lat = swiftyJsonVar["results"][0]["geometry"]["lat"].double
                let long = swiftyJsonVar["results"][0]["geometry"]["lng"].double
                let location = Location(title: title, latitude: lat ?? 0 , longitude: long ?? 0, locationSize: 0, duration: 0, startDate: nil, endDate: nil, activities: nil, hotel: nil)
                location!.activities = []
                
                onComplete(location)
            }
            else {
                onComplete(nil)
            }
        }
}
    
