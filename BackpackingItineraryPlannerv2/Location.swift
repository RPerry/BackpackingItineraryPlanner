//
//  Location.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/10/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Location {
    var title: String
    var latitude: Double
    var longitude: Double
    var locationSize: Int
    var duration: Int
    var activities: Array<Activity>?
    
    init?(title: String, latitude: Double, longitude: Double, locationSize: Int, duration: Int, activities: Array<Activity>?) {
        if title.isEmpty {
            return nil
        }
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.locationSize = locationSize
        self.duration = duration
        self.activities = activities
    }
}
