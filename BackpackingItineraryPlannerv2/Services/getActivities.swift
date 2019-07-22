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

func getActivities(city: String, duration: Int, activityCategories: Array<String>, budget: Int) -> Int {
    var activitiesArray: [Activity] = []
    let apiKey = "AIzaSyCDwCpgW1CpePn2Y6fIxuv7tkZ0hqkxyaA"
    var query = "restaurants"
    var location = ""
    var i = 1
    
    location = String(city.map {
        $0 == " " ? "+" : $0
    })
    
    print(location)
    
//        while i <= duration {
////            4 activites per day
////            send request loop the number of activty categories there are - store returns in an array per category
//            print("in loop")
//            Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(query)+in+\(location)&key=\(apiKey)")
//                .responseJSON { (responseData) -> Void in
//                    if((responseData.result.value) != nil) {
//                        let swiftyJsonVar = JSON(responseData.result.value!)
//                        print(swiftyJsonVar["results"][0])
////                        print(swiftyJsonVar["results"][0]["name"])
//                        var name = swiftyJsonVar["results"][0]["name"]
//                        var infoTags = swiftyJsonVar["results"][0]["types"]
//                        var lat = swiftyJsonVar["results"][0]["geometry"]["location"]["lat"]
//                        var long = swiftyJsonVar["results"][0]["geometry"]["location"]["lng"]
//                        var photoURL = swiftyJsonVar["results"][0][]["photos"][0]["html_attributions"][0]
//                        var priceLevel = swiftyJsonVar["results"][0]["price_level"]
//
//
//
//                        var activity = Activity(name: name.rawString()!, activityType: query, infoTags: infoTags, lat: lat.rawString()!, long: long.rawString()!, photoURL: photoURL.rawString()!, priceLevel: priceLevel)
//                        activitiesArray.append(activity)
//                    }
//            }
//            i += 1
//        }
    return(2)
}
//    getAccessKey(onComplete: {accessKey -> Void in
//        activityGetRequest(accessToken: accessKey!, cities: cities)
//    })
//    return("HEllo")
//}
//
//func getAccessKey(onComplete: @escaping (String?) -> Void) {
//    let APIKey = "iUUbifx6sCYU4QIbrNuzJusaGklEb0yB"
//    let APISecret = "HAlflmfgef1arXqY"
//    var accessKey = ""
//    let parameters: [String: String] = [
//        "grant_type" : "client_credentials",
//        "client_id" : "6ZV05Rji7uNeUAJeGDCzv89Rq6SN5DkR",
//        "client_secret" : "pvDyKrJUYwXdgcUG",
//    ]
//    let header = ["Content-Type": "application/x-www-form-urlencoded"]
//
//    Alamofire.request("https://test.api.amadeus.com/v1/security/oauth2/token", method: .post, parameters: parameters, headers: header)
//        .responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                let swiftyJsonVar = JSON(responseData.result.value!)
//                accessKey = swiftyJsonVar["access_token"].rawString()!
//                print(accessKey)
//                onComplete(accessKey)
//            }
//    }
//}
//
//func activityGetRequest(accessToken: String, cities: Array<Location>) -> String {
//    let header: HTTPHeaders = [
//        "Authorization": "Bearer \(accessToken)"
//    ]
//    print("next should be accesstoken")
//    print(accessToken)
//
//    for city in cities {
//        Alamofire.request("https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=\(city.latitude)&longitude=\(city.longitude)&radius=6", parameters: nil, headers: header)
//            .responseJSON { (responseData) -> Void in
//                if((responseData.result.value) != nil) {
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    print(swiftyJsonVar)
//                    print(swiftyJsonVar["data"]["category"])
//                    //                //                print(swiftyJsonVar["routes"][0]["name"])
//                    //                //                print(swiftyJsonVar["routes"][0]["segments"][0]["agencies"][0]["links"][0]["displayUrl"])
//                    //
//                }
//
//                //        add activity objects to that cities location object
//        }
//
//    }
//    return("hello")
