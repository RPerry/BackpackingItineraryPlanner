//
//  StartPageViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/26/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation
import UIKit

class StartPageViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var newItineraryButton: UIButton!
    @IBOutlet weak var viewSavedItineraryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.addBackground()
        newItineraryButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        newItineraryButton.layer.cornerRadius = 5
        newItineraryButton.layer.borderWidth = 1
        
        viewSavedItineraryButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        viewSavedItineraryButton.layer.cornerRadius = 5
        viewSavedItineraryButton.layer.borderWidth = 1
    }
}

