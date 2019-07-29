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
        
        randomizedActivitiesArray = (trip!.cities![rowClicked!].activities?.shuffled())!
        
        for activity in randomizedActivitiesArray {
            addActivityAnnotation(activity: activity)
        }
        
        addHotelAnnotation(hotel: trip!.cities![rowClicked!].hotel!)
        
        self.cityDetailMapView.showAnnotations(self.cityDetailMapView.annotations, animated: true)
        
        if rowClicked! != trip!.cities!.count - 1 {
            let transportation = trip!.transportation![rowClicked!]
            let duration = Double(transportation.duration) / 60.0
            print("duration \(duration)")
            transportationLabel.text = "Transportation from \(transportation.startCity) to \(transportation.endCity): \n \(transportation.type) - \(transportation.company) \n Cost: $\(Int(transportation.cost)) \n Duration: \(Int(duration)) hr \(Int(duration.truncatingRemainder(dividingBy: 1) * 100)) min"
        } else {
            transportationLabel.text = "Transportation: \n Your Trip Is Over!"
        }
    }
    
    func allActivitiesinLocation(location: Location) {
        print("Location: \(location.title)")
//        var datesInLocation: [Date]
//        var date = location.startDate
//        if location.startDate != location.endDate {
//            while date! <= location.endDate! {
//                datesInLocation!.append(date!)
//                let calendar = Calendar.current
//                date = calendar.date(byAdding: .day, value: 1, to: date!)
////                date = Calendar.date(byAdding: .day, value: 1, to: date)!
//            }
//        } else {
//            datesInLocation!.append(date!)
//        }
        
//        var randomIntsforActvities: Array<Int>
//        var randomIntsforActvities: Array<Int> = []
//        var i = 1
//        var numberofActivtiesCountArray: Array<Int> = []
//        var j = 0
//        while j <= location.activities!.count - 1 {
//            numberofActivtiesCountArray.append(j)
//            j += 1
//        }
//        while i <= (location.duration - 1) * 4 {
//            print("Number of activities in location: \(location.activities!.count)")
//            let randomNumber = numberofActivtiesCountArray.randomElement()!
//            print("random number: \(randomNumber)")
//            randomIntsforActvities.append(randomNumber)
//            if let index = numberofActivtiesCountArray.firstIndex(of: randomNumber) {
//                numberofActivtiesCountArray.remove(at: index)
//            }
//            i += 1
//        }
        
//        for date in datesInLocation! {
//        var n = 1
//        print("Duration in city: \(location.duration)")
//        var numberOfActivities = location.duration * 4
//        print("randomInts array: \(randomIntsforActvities)")
//        print("number of activities: \(numberOfActivities)")
//        while n < numberOfActivities {
//            allThingsinLocationArray.append(location.activities![randomIntsforActvities[n - 1]])
//            n += 1
//        }
//        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip!.cities![rowClicked!].activities!.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         allActivitiesinLocation(location: trip!.cities![rowClicked!])
        let cell:CityDayCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CityDayCustomCell
        let activity = randomizedActivitiesArray[indexPath.row]
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
