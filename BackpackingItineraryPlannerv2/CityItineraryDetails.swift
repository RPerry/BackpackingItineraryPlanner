//
//  CityItineraryDetails.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/26/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

import UIKit
import MapKit


class CityItineraryDetails:  UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tripName: String?
    var trip: Trip?
    var rowClicked: Int?
//    var allThingsinLocationDictArray: [[Date:Any]] = []
//    var datesInLocation: [Date]?
    var randomizedActivitiesArray: [Activity] = []
    var activityArrayofArrays = [[Activity]]()
    
    let cellReuseIdentifier = "ActivityCustomCell"
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hotelLabel: UILabel!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var cityDetailMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        cityNameLabel.text = "Daily Itinerary for \(trip!.cities![rowClicked!].title)"
        hotelLabel.text = "Hotel: \n \(trip!.cities![rowClicked!].hotel!.name!) \n Cost: $\(trip!.cities![rowClicked!].hotel!.cost!)"
        
        tableView.rowHeight = 70
        
        view.addBackground(imageName: "lighterbluegradient")
        self.tableView.backgroundColor = UIColor.clear
        
        
        randomizedActivitiesArray = (trip!.cities![rowClicked!].activities?.shuffled())!
        
        let j = trip!.cities![rowClicked!].duration
        var l = 0
        var m = 3
        
        for k in 1...j {
            let arraySlice = randomizedActivitiesArray[l...m]
            let array = Array(arraySlice)
            activityArrayofArrays.append(array)
            l += 4
            m += 4
        }
        
        
        for activity in randomizedActivitiesArray {
            addActivityAnnotation(activity: activity)
        }
        
        addHotelAnnotation(hotel: trip!.cities![rowClicked!].hotel!)
        
        self.cityDetailMapView.showAnnotations(self.cityDetailMapView.annotations, animated: true)
        
        if rowClicked! != trip!.cities!.count - 1 {
            
            for transport in trip!.transportation! {
                if transport.startCity == trip!.cities![rowClicked!].title {
                    let transportation = transport
                    let duration = Double(transportation.duration) / 60.0
                    transportationLabel.text = "Transportation from \(transportation.startCity) to \(transportation.endCity): \n \(transportation.type) - \(transportation.company) \n Cost: $\(Int(transportation.cost)) \n Duration: \(Int(duration)) hr \(Int(duration.truncatingRemainder(dividingBy: 1) * 100)) min"
                }
            }
//            print(trip!.transportation![rowClicked!].startCity)
//            let transportation = trip!.transportation![rowClicked!]
//            let duration = Double(transportation.duration) / 60.0
//            print("duration \(duration)")
//            transportationLabel.text = "Transportation from \(transportation.startCity) to \(transportation.endCity): \n \(transportation.type) - \(transportation.company) \n Cost: $\(Int(transportation.cost)) \n Duration: \(Int(duration)) hr \(Int(duration.truncatingRemainder(dividingBy: 1) * 100)) min"
            } else {
            transportationLabel.text = "Transportation: \n Your Trip Is Over!"
        }
    }
    
    func allActivitiesinLocation(location: Location) {
        print("Location: \(location.title)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trip!.cities![rowClicked!].duration
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let formatter = DateFormatter()
        
        if section == 0 {
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let stringDate = formatter.string(from: trip!.cities![rowClicked!].startDate!)
            let startDate = formatter.date(from: stringDate)
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            let myStartDateString = formatter.string(from: startDate!)
            label.text = myStartDateString
        } else {
            let calendar = Calendar.current
            let endDate = calendar.date(byAdding: .day, value: section, to: trip!.cities![rowClicked!].startDate!)
            
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let stringDate = formatter.string(from: endDate!)
            let startDate = formatter.date(from: stringDate)
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            let myStartDateString = formatter.string(from: startDate!)
            label.text = myStartDateString
        }
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
 
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         allActivitiesinLocation(location: trip!.cities![rowClicked!])
        let cell:CityDayCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CityDayCustomCell
        let activity = activityArrayofArrays[indexPath.section][indexPath.row]
                cell.activity = activity
                return cell
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
    
    func addActivityAnnotation(activity: Activity) {
        let annotation = MKPointAnnotation()
        annotation.title = activity.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: activity.lat, longitude: activity.long)
        cityDetailMapView.addAnnotation(annotation)
    }
    
    func addHotelAnnotation(hotel: Hotel) {
        let annotation = MKPointAnnotation()
        annotation.title = hotel.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: hotel.lat!, longitude: hotel.long!)
        cityDetailMapView.addAnnotation(annotation)
    }
}
