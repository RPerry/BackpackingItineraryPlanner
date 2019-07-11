//
//  ViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/9/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON
//import GoogleMaps



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    var userInputCity = ""
    @IBAction func citySubmitOnClick(_ sender: Any) {
        userInputCity = cityTextField.text!
    }
    
    var locations: [Location] = [
        Location(title: "New York, NY",    latitude: 40.713054, longitude: -74.007228)!,
        Location(title: "Los Angeles, CA", latitude: 34.052238, longitude: -118.243344)!,
        Location(title: "Chicago, IL",     latitude: 41.883229, longitude: -87.632398)!
    ]
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
        
        
        

        for location in locations {
            addAnnotation(location: location)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

    func addAnnotation(location: Location) {
        let annotation = MKPointAnnotation()
        annotation.title = location.title
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        mapView.addAnnotation(annotation)
    }
    
    func checkForSpace(userCity: String) {
        if userCity.hasPrefix(" ") {
            userInputCity = String(userInputCity.dropFirst())
        } else if userCity.hasSuffix(" ") {
            userInputCity = String(userInputCity.dropLast())
        }
    }

    @IBAction func APIRequest(_ sender: Any) {
        print("retrieving location")
        checkForSpace(userCity: userInputCity)
        getCityLatAndLong(city: userInputCity, countryCode: "US", onComplete: { location -> Void in
            if let loc = location {
                self.locations.append(loc)
                self.addAnnotation(location: loc)
            }
        })
    }

}
