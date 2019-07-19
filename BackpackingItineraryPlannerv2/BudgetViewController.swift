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
    
    @IBAction func budgetOnClick(_ sender: Any) {
        trip?.budget = tripBudget
        print(trip?.budget)
        
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
        
        budgetdropdown.selectedRowColor = .lightGray
        budgetdropdown.optionArray = ["💲", "💲💲", "💲💲💲"]
        budgetdropdown.optionIds = [1,2,3]
        
        //    // The the Closure returns Selected Index and String
        budgetdropdown.didSelect{(selectedText , index ,id) in
            print(id)
            self.tripBudget = id
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
        
        }
    }
}
