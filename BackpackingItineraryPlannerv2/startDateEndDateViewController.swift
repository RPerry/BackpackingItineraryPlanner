//
//  startDateEndDateViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/11/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit

class startDateEndDateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var startDateTextField: UITextField!
    private var startDatePicker: UIDatePicker?
    private var endDatePicker: UIDatePicker?
    
    @IBOutlet weak var endDateTextField: UITextField!
    
    @IBOutlet weak var shortDurationWarningLabel: UILabel!
    
    var tripName: String?
    var trip: Trip?
    
    
   
    
    @IBAction func tripDatesonClick(_ sender: Any) {
        
        trip?.startDate = getDate(dateString: startDateTextField.text ?? "00/00/00")
        trip?.endDate = getDate(dateString: endDateTextField.text ?? "00/00/00")
        
        let diffInDays = Calendar.current.dateComponents([.day], from: trip!.startDate!, to: trip!.endDate!).day!
        print("next is diffindays")
        print(diffInDays)
//        Should the number of days be the difference in days or days plus one???? 8/15-8/20 is 5 or 6 days??
        trip?.duration = Int(diffInDays) + 1
        
        if (trip!.duration)! < trip!.cities!.count {
            shortDurationWarningLabel.text = "Trip Duration Is Not Long Enough to Visit All Cities"
        } else {
            self.performSegue(withIdentifier: "traveldatesVCtopracticerouteVC", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "traveldatesVCtopracticerouteVC"){
            let displayVC = segue.destination as! PracticeRouteViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDatePicker = UIDatePicker()
        startDatePicker?.datePickerMode = .date
        startDatePicker?.addTarget(self, action: #selector(startDateEndDateViewController.startDateChanged(startDatePicker:)), for: .valueChanged)
        
        endDatePicker = UIDatePicker()
        endDatePicker?.datePickerMode = .date
        endDatePicker?.addTarget(self, action: #selector(startDateEndDateViewController.endDateChanged(endDatePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startDateEndDateViewController.viewTapped(gestureRecognizer:)))
        

        view.addGestureRecognizer(tapGesture)
        
        startDateTextField.inputView = startDatePicker
        endDateTextField.inputView = endDatePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func startDateChanged(startDatePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        startDateTextField.text = dateFormatter.string(from: startDatePicker.date)
            view.endEditing(true )
    }
    
    @objc func endDateChanged(endDatePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        endDateTextField.text = dateFormatter.string(from: endDatePicker.date)
        view.endEditing(true )
    }
}

