//
//  Activity.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/19/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Activity {
    let name: String
    let activityType: String
    let infoTags: Array<String>
    let lat: Double
    let long: Double
    let rating: Double
    
    init?(name: String, activityType: String, infoTags: Array<String>, lat: Double, long: Double, rating: Double) {
        
        self.name = name
        self.activityType = activityType
        self.infoTags = infoTags
        self.lat = lat
        self.long = long
        self.rating = rating
    }
}
