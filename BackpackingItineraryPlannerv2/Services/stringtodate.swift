//
//  stringtodate.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/15/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

func getDate(dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yy"
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale.current
    return dateFormatter.date(from: dateString)
}
