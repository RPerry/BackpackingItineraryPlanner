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
    var budget: Double?
    var activityCategories: Array<String>?
    var numberofDays: Double?
    
    init?(tripName: String, startCity: String?, endCity: String?, startDate: Date?, endDate: Date?, cities: Array<Location>?, budget: Double?, activityCategories: Array<String>?, numberofDays: Double?) {
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
        self.numberofDays = numberofDays
    }
}
