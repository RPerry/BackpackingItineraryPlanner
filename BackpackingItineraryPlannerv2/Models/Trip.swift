//
//  Trip.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/10/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

struct Trip: Codable {
    var tripName: String
    var startCity: String
    var endCity: String
    var startDate: Date
    var endDate: Date
    var cities: Array<String>
    var budget: Double
    var activityCategories: Array<String>
}
