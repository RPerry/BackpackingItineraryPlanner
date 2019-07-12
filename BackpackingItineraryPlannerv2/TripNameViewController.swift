//
//  TripNameViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class TripNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tripNameTextField: UITextField!
    
    
    var tripName = ""
    
    @IBAction func tripNameOnClick(_ sender: Any) {
        tripName = tripNameTextField.text!
        print(tripName)
        var newTrip = Trip(tripName: tripName, startCity: nil, endCity: nil, startDate: nil, endDate: nil, cities: nil, budget: nil, activityCategories: nil)
    }
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tripNameTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
}

