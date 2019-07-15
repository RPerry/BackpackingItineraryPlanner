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
    
     var newTrip = Trip(tripName: "", startCity: nil, endCity: nil, startDate: nil, endDate: nil, cities: nil, budget: nil, activityCategories: nil, numberofDays: nil)
    
    @IBAction func tripNameOnClick(_ sender: Any) {
        tripName = tripNameTextField.text!
        print(tripName)
        
        newTrip?.tripName = tripName
        
        self.performSegue(withIdentifier: "tripnameVCtostartcityendcityVC", sender: self)
    }
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
//    newcode - test
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tripnameVCtostartcityendcityVC"){
            let displayVC = segue.destination as! StartCityEndCityViewController
            displayVC.tripName = newTrip?.tripName
            displayVC.trip = newTrip
        }
    }
    
    //        oldcode
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripNameTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
}

