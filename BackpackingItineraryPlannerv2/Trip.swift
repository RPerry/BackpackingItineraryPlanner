//
//  Trip.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class Trip {
    var tripName: String?
    var startCity: String?
    var endCity: String?
    var startDate: Date?
    var endDate: Date?
    var cities: Array<Location>?
    var budget: Int?
    var activityCategories: Array<String>?
    var duration: Int?
    var locations: Array<Dictionary<String, Any>>?
    var transportation: Array<Transportation>?
    var price: Double?
    
    init?(tripName: String, startCity: String?, endCity: String?, startDate: Date?, endDate: Date?, cities: Array<Location>?, budget: Int?, activityCategories: Array<String>?, duration: Int?, locations: Array<Dictionary<String, Any>>?, transportation:Array<Transportation>?, price: Double?) {
//        if tripName.isEmpty {
//            return nil
//        }
        self.tripName = tripName
        self.startCity = startCity
        self.endCity = endCity
        self.startDate = startDate
        self.endDate = endDate
        self.cities = cities
        self.budget = budget
        self.activityCategories = activityCategories
        self.duration = duration
        self.locations = locations
        self.transportation = transportation
        self.price = price
    }
}
