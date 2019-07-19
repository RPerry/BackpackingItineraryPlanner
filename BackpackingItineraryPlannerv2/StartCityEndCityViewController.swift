//
//  StartCityEndCityViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit
//import FirebaseDatabase

class StartCityEndCityViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var startCityTextField: UITextField!
    
    @IBOutlet weak var endCityTextField: UITextField!
    
    @IBAction func startEndCityOnClick(_ sender: Any) {
        viewTapped()
    }
    @IBOutlet weak var tripNameLabel: UILabel!
    
    @IBAction func endCityAsStartCityOnClick(_ sender: Any) {
        endCityTextField.text = startCityTextField.text
    }
    
    @IBAction func startCityendCityonClick(_ sender: Any) {
        trip?.startCity = startCityTextField.text
        trip?.endCity = endCityTextField.text
        
//        ref.child("id2/startCity").setValue("\(startCityTextField.text!)")
//        ref.child("id2/endCity").setValue("\(endCityTextField.text!)")
        
        self.performSegue(withIdentifier: "startcityendcityVCtocitiesVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startcityendcityVCtocitiesVC"){
            let displayVC = segue.destination as! ViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
        }
    }
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
    var tripName: String?
    var trip: Trip?
    
//    let ref = Database.database().reference()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == startCityTextField {
            textField.resignFirstResponder()
            endCityTextField.becomeFirstResponder()
        }else{
            endCityTextField.resignFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
//        ref.child("id2").observeSingleEvent(of: .value)
//        {(snapshot) in
//            let data = snapshot.value as? [String:Any]
//            print(data)
//        }
        
        tripNameLabel.text = tripName
        
        startCityTextField.delegate = self
        endCityTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
}
