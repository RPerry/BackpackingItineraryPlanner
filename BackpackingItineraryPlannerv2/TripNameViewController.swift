//
//  TripNameViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TripNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tripNameTextField: UITextField!
    
    
    var tripName = ""
    
    var newTrip = Trip(tripName: "", startCity: nil, endCity: nil, startDate: nil, endDate: nil, cities: nil, budget: nil, activityCategories: nil, duration: nil, locations: nil, transportation: nil, price: nil)
    
//    let ref = Database.database().reference()
    
    @IBAction func tripNameOnClick(_ sender: Any) {
        tripName = tripNameTextField.text!
        
        newTrip?.tripName = tripName
        
//        ref.child("id2").setValue(["tripName":"\(tripName)", "startCity": nil, "endCity": nil, "startDate": nil, "cities": nil, "budget": nil, "activityCategories": nil, "duration": nil])
        
        self.performSegue(withIdentifier: "tripnameVCtostartcityendcityVC", sender: self)
    }
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tripnameVCtostartcityendcityVC"){
            let displayVC = segue.destination as! StartCityEndCityViewController
            displayVC.tripName = newTrip?.tripName
            displayVC.trip = newTrip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripNameTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
        
//        deletelater!!!
//        print(cityPopulation(userCity: "New York"))
    }
    
}

