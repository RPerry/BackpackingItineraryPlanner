//
//  StartCityEndCityViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class StartCityEndCityViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var startCityTextField: UITextField!
    
    @IBOutlet weak var endCityTextField: UITextField!
    
    @IBAction func startEndCityOnClick(_ sender: Any) {
        viewTapped()
    }
    
    @IBAction func endCityAsStartCityOnClick(_ sender: Any) {
        endCityTextField.text = startCityTextField.text
    }
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
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
        
        
        startCityTextField.delegate = self
        endCityTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
}
