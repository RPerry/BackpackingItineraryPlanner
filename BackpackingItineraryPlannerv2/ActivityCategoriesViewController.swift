//
//  ActivityCategoriesViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/17/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

import UIKit
import iOSDropDown

class ActivityCategoriesViewController: UIViewController, UITextFieldDelegate {

    var tripName: String?
    var trip: Trip?
    var activityCategories: Array<String> = []
    var category: String = ""
    var categoryLabelString: String = ""
    
    @IBOutlet weak var ActivityCategoryDropDown: DropDown!
    @IBOutlet weak var chosenCategoriesLabel: UILabel!
    
    
    @IBAction func addCategoryButton(_ sender: Any) {
        self.activityCategories.append(category)
//        print(self.activityCategories)
        categoryLabelString += "\n"
        categoryLabelString += category
        print(categoryLabelString)
        chosenCategoriesLabel.text = categoryLabelString
//        chosenCategoriesLabel.frame.size.width = 100
//        chosenCategoriesLabel.frame.size.height = 100
        print(chosenCategoriesLabel.text!)
        ActivityCategoryDropDown.optionArray.removeAll { $0 == category }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityCategoryDropDown.selectedRowColor = .lightGray
        ActivityCategoryDropDown.optionArray = ["Sights", "Beach/Park", "Historical", "Nightlife", "Restaurant", "Shopping"]
        
        chosenCategoriesLabel.layer.borderWidth = 1.0
        
        ActivityCategoryDropDown.didSelect{(selectedText , index ,id) in
            self.category = selectedText
//            self.activityCategories.append(selectedText)
            
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
        }
    }
    
    @IBAction func activityCategoriesonClick(_ sender: Any) {
//        Variables
        var cost = 0.0
//        cost not including activities
        
//        Transportation!!!
        
        trip?.transportation = getAllCitiesTransportation(allCities: trip!.cities!, budget: trip!.budget!)
        
//        Activities!!!!
        daysPerCity(cities: trip!.cities!, trip: trip!)
        
//        for city in trip!.cities! {
//           city.activities = getActivities(city: city.title, duration: city.duration, activityCategories: trip!.activityCategories!, budget: trip!.budget!)
//        }
        
        
//        for trip in trip!.transportation! {
//            cost += trip.cost
//        }
//        print(cost)
    }
}
