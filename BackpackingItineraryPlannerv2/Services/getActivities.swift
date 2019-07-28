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

func getActivities(city: String, duration: Int, activityCategories: Array<String>, budget: Int, cityLocation: Location, onComplete: @escaping () -> Void) -> Void {
//    var activitiesArray: [Activity] = []
    var numberOfActivitiesPerCategory: [String: Double] = [:]
    let apiKey = googlePlacesAPIKey
    var extraActivities = 0.0
    var location = ""
    var numberofTotalActivities = 0
    
    location = String(city.map {
        $0 == " " ? "+" : $0
    })
    
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
        numberofTotalActivities += Int(numberofActivities)
    }
    
    activitiesAPI(numberOfActivitiesPerCategory: numberOfActivitiesPerCategory, location: location, apiKey: apiKey, cityLocation: cityLocation, numberofTotalActivities: numberofTotalActivities, onComplete: {return})
//        for (category, numberofActivities) in numberOfActivitiesPerCategory {
//            Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(category)+in+\(location)&key=\(apiKey)")
//                .responseJSON { (responseData) -> Void in
//                    if((responseData.result.value) != nil) {
//                        let swiftyJsonVar = JSON(responseData.result.value!)
////                        print(swiftyJsonVar)
//                        var i = 0
//                        while i < Int(numberofActivities) {
//                            let name = swiftyJsonVar["results"][i]["name"]
//                            let infoTag1 = swiftyJsonVar["results"][i]["types"][0].rawString()
//                            let infoTag2 = swiftyJsonVar["results"][i]["types"][1].rawString()
//                            let lat = swiftyJsonVar["results"][i]["geometry"]["location"]["lat"].rawString()
//                            let long = swiftyJsonVar["results"][i]["geometry"]["location"]["lng"].rawString()
//                            let rating = swiftyJsonVar["results"][i]["rating"].rawString()
//                            var tagArray: [String] = []
//                            tagArray.append(infoTag1!)
//                            tagArray.append(infoTag2!)
//
//                            let activity = Activity(name: name.rawString()!, activityType: category, infoTags: tagArray, lat: Double(lat!) as! Double, long: Double(long!) as! Double, rating: Double(rating!) as! Double)
////                            print("data from activity object")
//                            print(activity!.name)
//                            cityLocation.activities!.append(activity!)
//                            print("activities array count: \(cityLocation.activities!.count)")
//                            i += 1
//                        }
//                    }
//            }
//    }
//    print("# of Activites for \(city): \(cityLocation.activities!.count)")
//    return(activitiesArray)
}

func activitiesAPI(numberOfActivitiesPerCategory: [String: Double], location: String, apiKey: String, cityLocation: Location, numberofTotalActivities: Int, onComplete: @escaping () -> Void) -> Void {
    var responseCount = 0
    for (category, numberofActivities) in numberOfActivitiesPerCategory {
        var activityCount = 0
        Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(category)+in+\(location)&key=\(apiKey)")
            .responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    //                        print(swiftyJsonVar)
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
                        //                            print("data from activity object")
                        print(activity!.name)
//                        activitiesArray.append(activity)
                        cityLocation.activities!.append(activity!)
                        print("activities array count: \(cityLocation.activities!.count)")
                        i += 1
                        activityCount += 1
                        print(activityCount)
                        if activityCount == Int(numberofActivities) {
                            responseCount += 1
                        }
                        print("Response count: \(responseCount)")
                        print("Number of activity categories: \(numberOfActivitiesPerCategory.count)")
                        if responseCount == numberOfActivitiesPerCategory.count{
                            print("finally at activities on complete")
                            onComplete()
                        }
                    }
                    
                }
        }
    }
}
