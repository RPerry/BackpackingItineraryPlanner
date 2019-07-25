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
    var startDate: Date?
    var endDate: Date?
    var activities: Array<Activity>?
    var hotel: Hotel?
    
    init?(title: String, latitude: Double, longitude: Double, locationSize: Int, duration: Int, startDate: Date?, endDate: Date?, activities: Array<Activity>?, hotel: Hotel?) {
        if title.isEmpty {
            return nil
        }
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.locationSize = locationSize
        self.duration = duration
        self.startDate = startDate
        self.endDate = endDate
        self.activities = activities
        self.hotel = hotel
    }
}
