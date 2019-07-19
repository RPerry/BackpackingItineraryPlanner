//
//  PracticeRouteViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/15/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import Foundation

import UIKit
import MapKit




class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class PracticeRouteViewController: UIViewController, UITextFieldDelegate {

    var tripName: String?
    var trip: Trip?
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func toNextPageOnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "practicerouteVCtobudgetVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "practicerouteVCtobudgetVC"){
            let displayVC = segue.destination as! BudgetViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
        }
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let sourceLocation = CLLocationCoordinate2D(latitude:39.173209 , longitude: -94.593933)
    let destinationLocation = CLLocationCoordinate2D(latitude:38.643172 , longitude: -90.177429)
        
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}
