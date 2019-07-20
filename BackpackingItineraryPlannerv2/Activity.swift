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
    let infoTag: String
    let lat: Double
    let long: Double
    
    init?(name: String, activityType: String, infoTag: String, lat: Double, long: Double) {
        
        self.name = name
        self.activityType = activityType
        self.infoTag = infoTag
        self.lat = lat
        self.long = long
    }
}
