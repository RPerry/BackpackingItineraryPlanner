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
import Firebase

class ActivityCategoriesViewController: UIViewController, UITextFieldDelegate {

    var tripName: String?
    var trip: Trip?
    var activityCategories: Array<String> = []
    var category: String = ""
    var categoryLabelString: String = ""
//    let ref = Database.database().reference()
    
    @IBOutlet weak var chosenHeader: UILabel!
    @IBOutlet weak var ActivityCategoryDropDown: DropDown!
    @IBOutlet weak var chosenCategoriesLabel: UILabel!
    @IBOutlet weak var addCategoryButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier ==
            "ActivityCategoriesVCToTripItineraryVC"){
            let displayVC = segue.destination as! V2ItineraryViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
//            displayVC.locationNames = for city in trip.cities {
//                city.name
//            }
        }
    }
    
    
    @IBAction func addCategoryButton(_ sender: Any) {
        self.activityCategories.append(category)
        categoryLabelString += "\n"
        categoryLabelString += category
        chosenCategoriesLabel.text = categoryLabelString
        chosenCategoriesLabel.sizeToFit()
//        chosenCategoriesLabel.frame.size.width = 100
//        chosenCategoriesLabel.frame.size.height = 100
        ActivityCategoryDropDown.optionArray.removeAll { $0 == category }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackground(imageName: "lighterbluegradient")
        
        submitButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        submitButton.layer.cornerRadius = 5
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0).cgColor
        
        addCategoryButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        addCategoryButton.layer.cornerRadius = 5
        addCategoryButton.layer.borderWidth = 1
        addCategoryButton.layer.borderColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0).cgColor
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: chosenHeader.text!)
        attributeString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        let wholeStr = chosenHeader.text
        let range = chosenHeader.text!.count
        let rangeToUnderLine = NSRange(location: 0, length: range)
        let underLineTxt = NSMutableAttributedString(string: wholeStr!, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.8)])
        underLineTxt.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        chosenHeader.attributedText = underLineTxt
        
        
        ActivityCategoryDropDown.rowBackgroundColor = .clear
        ActivityCategoryDropDown.selectedRowColor = .lightGray
        ActivityCategoryDropDown.optionArray = ["Parks", "Historical", "Nightlife", "Restaurants", "Shopping", "Museums"]
        
        ActivityCategoryDropDown.didSelect{(selectedText , index ,id) in
            self.category = selectedText
//            self.activityCategories.append(selectedText)
            
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
        }
    }
    
    @IBAction func activityCategoriesonClick(_ sender: Any) {
        trip?.activityCategories = activityCategories
//        Variables
        var cost = 0.0
//        cost not including activities
        
//        Transportation!!!
        getAllCitiesTransportation(trip: trip!, allCities: trip!.cities!, budget: trip!.budget!, onComplete: {
        print("in get all cities transportation oncomplete")
//        Activities!!!!
            daysPerCity(cities: self.trip!.cities!, trip: self.trip!, onComplete: {
            getDatesForLocations(cities: self.trip!.cities!, tripStartDate: self.trip!.startDate!, tripEndDate: self.trip!.endDate!)
            
            loop(onComplete: {
//                for city in self.trip!.cities! {
//                    print("hotels name: \(city.hotel!.name)")
//                    print("hotels name: \(city.hotel!.cost)")
//                }
//                self.ref.child("\(self.trip!.tripName!)/tripName").setValue("\(self.trip!.tripName!)")
//                self.ref.child("\(self.trip!.tripName!)/startCity").setValue("\(self.trip!.startCity!)")
//                self.ref.child("\(self.trip!.tripName!)/endCity").setValue("\(self.trip!.endCity!)")
//                self.ref.child("\(self.trip!.tripName!)/startDate").setValue("\(self.trip!.startDate!)")
//                self.ref.child("\(self.trip!.tripName!)/endDate").setValue("\(self.trip!.endDate!)")
//                self.ref.child("\(self.trip!.tripName!)/cities").setValue("\(self.trip!.cities!)")
//                self.ref.child("\(self.trip!.tripName!)/budget").setValue("\(self.trip!.budget!)")
//                self.ref.child("\(self.trip!.tripName!)/activityCategories").setValue("\(self.trip!.activityCategories!)")
//                self.ref.child("\(self.trip!.tripName!)/duration").setValue("\(self.trip!.duration!)")
//               
//                print(self.trip!.locations)
////                self.ref.child("\(self.trip!.tripName!)/locations").setValue("\(self.trip!.locations!)")
//                self.ref.child("\(self.trip!.tripName!)/transportation").setValue("\(self.trip!.transportation!)")
//                self.ref.child("\(self.trip!.tripName!)/price").setValue("\(self.trip!.price!)")
                for city in self.trip!.cities! {
                    print("Previous view: \(city.activities!.count)")
                }
                
                self.performSegue(withIdentifier: "ActivityCategoriesVCToTripItineraryVC", sender: self)
                })
            })
//            for city in self.trip!.cities! {
//
////                city.activities =
//                    getActivities(city: city.title, duration: city.duration, activityCategories: self.trip!.activityCategories!, budget: self.trip!.budget!, cityLocation: city)
//
//                let calendar = Calendar.current
//                let checkoutDate = calendar.date(byAdding: .day, value: 1, to: city.endDate!)
//
//                if city.endDate == self.trip?.endDate {
//                    city.hotel = getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: city.endDate!, locationSize: city.locationSize, budget: self.trip!.budget!)
//                } else {
//                    city.hotel = getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: checkoutDate!, locationSize: city.locationSize, budget: self.trip!.budget!)
//                }
//            }

//            self.performSegue(withIdentifier: "ActivityCategoriesVCToTripItineraryVC", sender: self)
        })
        
        func loop(onComplete: @escaping () -> Void) -> Void {
            var finishedFuncs = 0
            for city in self.trip!.cities! {
                var allCalls = 0
//                                city.activities =
                getActivities(city: city.title, duration: city.duration, activityCategories: self.trip!.activityCategories!, budget: self.trip!.budget!, cityLocation: city, onComplete: {
                    allCalls += 1
//                    print("in get activities oncomplete")
                    
                    let calendar = Calendar.current
                    let checkoutDate = calendar.date(byAdding: .day, value: 1, to: city.endDate!)
                    
                    if city.endDate == self.trip?.endDate {
                        getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: city.endDate!, locationSize: city.locationSize, budget: self.trip!.budget!, cityLocation: city, onComplete: { hotel -> Void in
                            city.hotel = hotel
                            print("in get activities hotellll: \(city.hotel!.name)")
                            allCalls += 1
//                            print("in get hotel oncomplete")
//                            print("All Calls: \(allCalls)")
                            if allCalls == 2 {
                                finishedFuncs += 1
                            }
                            if finishedFuncs == self.trip!.cities!.count - 1 {
//                                print("Finished funcs: \(finishedFuncs)")
                                onComplete()
                            }
                        })
                    } else {
                        getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: checkoutDate!, locationSize: city.locationSize, budget: self.trip!.budget!, cityLocation: city, onComplete: { hotel -> Void in
                            city.hotel = hotel
                            allCalls += 1
//                            print("in get hotel oncomplete")
//                            print("All Calls: \(allCalls)")
                            if allCalls == 2 {
                                finishedFuncs += 1
                            }
//                            print("Finished funcs: \(finishedFuncs)")
                            if finishedFuncs == self.trip!.cities!.count - 1 {
                                onComplete()
                            }
                        })
                    }
                })
                
//                let calendar = Calendar.current
//                let checkoutDate = calendar.date(byAdding: .day, value: 1, to: city.endDate!)
//
//                if city.endDate == self.trip?.endDate {
//                    getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: city.endDate!, locationSize: city.locationSize, budget: self.trip!.budget!, onComplete: { hotel -> Void in
//                            city.hotel = hotel
//                            allCalls += 1
//                            print("in get hotel oncomplete")
//                        })
//                } else {
//                    getHotel(city: city.title, checkinDate: city.startDate!, checkoutDate: checkoutDate!, locationSize: city.locationSize, budget: self.trip!.budget!, onComplete: { hotel -> Void in
//                        city.hotel = hotel
//                        allCalls += 1
//                        print("in get hotel oncomplete")
//                    })
//                }
//                print("All Calls: \(allCalls)")
//                if allCalls == 2 {
//                    finishedFuncs += 1
//                }
//                if finishedFuncs == self.trip!.cities!.count - 1 {
//                    print("Finished funcs: \(finishedFuncs)")
//                    onComplete()
//                }
            }
        }
        
        func segue() {
            self.performSegue(withIdentifier: "ActivityCategoriesVCToTripItineraryVC", sender: self)
        }
        
//        func printFunction() {
//            print("loop has finished")
//        }
//
//        // New for loop syntax and naming convention
//        func loop(withCompletion completion: () -> Void ) {
//            for i in 0 ..< 5 {
//                print(i)
//            }
//            completion()
//        }
//        Then call it like this:
//
//        loop(withCompletion: segue)
        
        
        
//        for city in trip!.cities! {
//            print(city.title)
//            print(city.duration)
//           getActivities(city: city.title, duration: city.duration, activityCategories: trip!.activityCategories!, budget: trip!.budget!)
//        }
        
        
//        for trip in trip!.transportation! {
//            cost += trip.cost
//        }
//        print(cost)
    }
}
