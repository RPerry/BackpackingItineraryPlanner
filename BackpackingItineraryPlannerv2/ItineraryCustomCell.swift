//
//  ItineraryCustomCell.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/26/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class ItineraryCustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    
    var city: Location? {
        didSet {
            guard let city = city else { return }

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let stringStartDate = formatter.string(from: city.startDate!)
            let stringEndDate = formatter.string(from: city.endDate!)
            let startDate = formatter.date(from: stringStartDate)
            let endDate = formatter.date(from: stringEndDate)
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            let myStartDateString = formatter.string(from: startDate!)
            let myEndDateString = formatter.string(from: endDate!)


            nameLabel.text = city.title
            dateLabel.text = "\(myStartDateString) - \(myEndDateString)"
            //            cityImageView.image = city.image
        }
    }

}
