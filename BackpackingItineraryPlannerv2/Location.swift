//
//  Location.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/10/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Location {
    let title: String
    let latitude: Double
    let longitude: Double
    let locationSize: Int
    let duration: Int
    
    init?(title: String, latitude: Double, longitude: Double, locationSize: Int, duration: Int ) {
        if title.isEmpty {
            return nil
        }
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.locationSize = locationSize
        self.duration = duration
    }
}
