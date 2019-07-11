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
    
    init?(title: String, latitude: Double, longitude: Double) {
        if title.isEmpty {
            return nil
        }
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
}
