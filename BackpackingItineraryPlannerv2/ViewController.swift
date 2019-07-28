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
import FirebaseDatabase
//import GoogleMaps


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addCityButton: UIButton!
    @IBOutlet weak var citiesSubmitButton: UIButton!
    
    @IBOutlet weak var cityTripLabel: UILabel!
    
    struct CityLabels {
        let map: String
        let api: String
    }
    
    @IBAction func citySubmitOnClick(_ sender: Any) {
        let cityLabels = checkForSpace(userCity: cityTextField.text!)
        getCityLatAndLong(city: cityLabels.api, title: cityLabels.map, countryCode: "US", onComplete: { location -> Void in
            if let loc = location {
                self.locations.append(loc)
                self.addAnnotation(location: loc)
            }
        })
        cityTextField.text = ""
    }
    
    
    @IBAction func tripCitiesonClick(_ sender: Any) {
        
        let endCityLabels = checkForSpace(userCity: trip!.endCity!)
        getCityLatAndLong(city: endCityLabels.api, title: endCityLabels.map, countryCode: "US", onComplete: { location -> Void in
            if let loc = location {
                self.locations.append(loc)
                self.addAnnotation(location: loc)
                self.trip!.cities = self.locations
                self.performSegue(withIdentifier: "tripCitiesVCtotravelDatesVC", sender: self)
            }
        })
        
//        for location in locations {
//            print(location.title)
//        }
//        trip!.cities = locations
//        print(locations)
        
        
//        self.performSegue(withIdentifier: "tripCitiesVCtotravelDatesVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tripCitiesVCtotravelDatesVC"){
            let displayVC = segue.destination as! startDateEndDateViewController
            displayVC.tripName = trip?.tripName
            displayVC.trip = trip
        }
    }
    
    
    var locations: [Location] = [
//        Location(title: "New York",    latitude: 40.713054, longitude: -74.007228)!,
//        Location(title: "Los Angeles", latitude: 34.052238, longitude: -118.243344)!,
//        Location(title: "Chicago",     latitude: 41.883229, longitude: -87.632398)!
    ]
    
    @objc func viewTapped(){
        self.view.endEditing(true)
    }
    
    var tripName: String?
    var trip: Trip?
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackground(imageName: "lighterbluegradient")
        
        cityTextField.addLine(position: .LINE_POSITION_BOTTOM, color: .black, width: 0.5)
        
        addCityButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        addCityButton.layer.cornerRadius = 5
        addCityButton.layer.borderWidth = 1
        addCityButton.layer.borderColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0).cgColor
        
        citiesSubmitButton.backgroundColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0)
        citiesSubmitButton.layer.cornerRadius = 5
        citiesSubmitButton.layer.borderWidth = 1
        citiesSubmitButton.layer.borderColor = UIColor(red:0.33, green:0.42, blue:0.65, alpha:1.0).cgColor
        
        let startTripLabels = checkForSpace(userCity: trip!.startCity!)
        getCityLatAndLong(city: startTripLabels.api, title: startTripLabels.map, countryCode: "US", onComplete: { location -> Void in
            if let loc = location {
                self.locations.append(loc)
                self.addAnnotation(location: loc)
            }
        })

        
        
        ref.child("id2").observeSingleEvent(of: .value)
        {(snapshot) in
            let data = snapshot.value as? [String:Any]
//            print(data)
        }
        
        
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
    
    func checkForSpace(userCity: String) -> CityLabels {
        let mapLabel = userCity.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
        
        let apiLabel = String(mapLabel.map {
            $0 == " " ? "_" : $0
        })
  
        return CityLabels(map: mapLabel, api: apiLabel)
    }

}


//userinputcityforapi is not updating. Copy checkforspace function and make own variable?
