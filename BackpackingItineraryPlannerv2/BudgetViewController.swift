//
//  BudgetViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/15/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

import UIKit
import iOSDropDown
//import Emoji

class BudgetViewController: UIViewController, UITextFieldDelegate {
    
    var tripName: String?
    var trip: Trip?
    var tripBudget: Int?
    
    @IBOutlet weak var budgetdropdown: DropDown!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBAction func budgetOnClick(_ sender: Any) {
        trip?.budget = tripBudget
        
        self.performSegue(withIdentifier: "budgetVCtoActivityCategoryVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "budgetVCtoActivityCategoryVC"){
            let displayVC = segue.destination as! ActivityCategoriesViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackground(imageName: "lighterbluegradient")
        
        submitButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        submitButton.layer.cornerRadius = 5
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0).cgColor
        
        
        budgetdropdown.selectedRowColor = .lightGray
        budgetdropdown.rowBackgroundColor = .clear
        budgetdropdown.optionArray = ["💸", "💸💸", "💸💸💸"]
        budgetdropdown.optionIds = [1,2,3]
        
        //    // The the Closure returns Selected Index and String
        budgetdropdown.didSelect{(selectedText , index ,id) in
            self.tripBudget = id
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
        
        }
    }
}
