//
//  CityDayCustomCell.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/27/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class CityDayCustomCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    
    var activity: Activity? {
        didSet {
            guard let activity = activity else { return }
            print(activity)
            categoryLabel.text = activity.activityType
            activityLabel.text = activity.name
//            dateLabel.text = "\(myStartDateString) - \(myEndDateString)"
            //            cityImageView.image = city.image
        }
    }
}
