//
//  V2ItineraryViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/26/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit
import MapKit

class V2ItineraryViewController:  UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    // table
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var ItineraryLabel: UILabel!
    @IBOutlet weak var ItineraryTableView: UITableView!
    @IBOutlet weak var TotalTripCostLabel: UILabel!
    
    var tripName: String?
    var trip: Trip?
    var rowClicked: Int?
    
    let cellReuseIdentifier = "V2CityCell"
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackground(imageName: "lighterbluegradient")
        self.tableView.backgroundColor = UIColor.clear
        
        var totalCost = 0.0
        
        for city in trip!.cities! {
            addAnnotation(location: city)
//            print("\(city.title) hotel name: \(city.activities!.count)")
//            totalCost += city.hotel!.cost!
        }
        
        for transportation in trip!.transportation! {
            totalCost += transportation.cost
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        ItineraryLabel.text = "\(trip!.tripName!) Itinerary"
        TotalTripCostLabel.text = "Total Trip Cost: $\(totalCost)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip!.cities!.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItineraryCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ItineraryCustomCell
        
        let city = trip!.cities![indexPath.row]
        cell.city = city
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier ==
                "ItineraryVCtoCityItineraryVC"){
                let displayVC = segue.destination as! CityItineraryDetails
                displayVC.tripName = tripName
                displayVC.trip = trip
                displayVC.rowClicked = rowClicked
                //            displayVC.locationNames = for city in trip.cities {
                //                city.name
                //            }
            }
        }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
        rowClicked = indexPath.row
        print("row clicked: \(rowClicked)")
        performSegue(withIdentifier: "ItineraryVCtoCityItineraryVC", sender: self)
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
    
    
}
