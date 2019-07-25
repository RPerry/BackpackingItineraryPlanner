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

func getActivities(city: String, duration: Int, activityCategories: Array<String>, budget: Int) -> Array<Activity> {
    var activitiesArray: [Activity] = []
    var numberOfActivitiesPerCategory: [String: Double] = [:]
    let apiKey = googlePlacesAPIKey
    var extraActivities = 0.0
    var location = ""
    
    location = String(city.map {
        $0 == " " ? "+" : $0
    })
    
    print(location)
    
    for activity in activityCategories {
        numberOfActivitiesPerCategory[activity] = Double(duration * 4) / Double(activityCategories.count)
    }
    
    
    for (category, numberofActivites) in numberOfActivitiesPerCategory {
        let overWholeActivity = numberofActivites.truncatingRemainder(dividingBy: 1)
        extraActivities += overWholeActivity
        let newNumberofActivities = numberofActivites - overWholeActivity
        numberOfActivitiesPerCategory.updateValue(newNumberofActivities, forKey: category)
    }
    
    if extraActivities > 0.0 {
        let category = activityCategories[0]
        var updateNumber = numberOfActivitiesPerCategory[category]
        updateNumber! += 1.0
        numberOfActivitiesPerCategory.updateValue(updateNumber!, forKey: category)
        extraActivities -= 1
    }
    
    print(numberOfActivitiesPerCategory)
        for (category, numberofActivities) in numberOfActivitiesPerCategory {
            Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=museum+in+\(city)&key=\(apiKey)")
                .responseJSON { (responseData) -> Void in
                    if((responseData.result.value) != nil) {
                        let swiftyJsonVar = JSON(responseData.result.value!)
//                        print(swiftyJsonVar)
                        print("city \(city)")
                        var i = 0
                        while i < Int(numberofActivities) {
                            let name = swiftyJsonVar["results"][i]["name"]
                            let infoTag1 = swiftyJsonVar["results"][i]["types"][0].rawString()
                            let infoTag2 = swiftyJsonVar["results"][i]["types"][1].rawString()
                            let lat = swiftyJsonVar["results"][i]["geometry"]["location"]["lat"].rawString()
                            let long = swiftyJsonVar["results"][i]["geometry"]["location"]["lng"].rawString()
                            let rating = swiftyJsonVar["results"][i]["rating"].rawString()
                            var tagArray: [String] = []
                            tagArray.append(infoTag1!)
                            tagArray.append(infoTag2!)

                            let activity = Activity(name: name.rawString()!, activityType: category, infoTags: tagArray, lat: Double(lat!) as! Double, long: Double(long!) as! Double, rating: Double(rating!) as! Double)
                            print("data from activity object")
                            print(activity!.rating)
                            activitiesArray.append(activity!)
                            i += 1
                            print(activitiesArray)
                        }
                    }
            }
    }
    return(activitiesArray) 
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

