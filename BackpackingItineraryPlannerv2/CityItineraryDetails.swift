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
    var allThingsinLocationArray: [Activity] = []
    var randomIntsforActvities: Array<Int>?

    let cellReuseIdentifier = "ActivityCustomCell"
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityNameLabel.text = "Daily Itinerary for \(trip!.cities![rowClicked!].title)"
        
    }
    
    func allActivitiesinLocation(location: Location) {
        
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
        var i = 1
        while i <= 4 {
            randomIntsforActvities!.append(Int.random(in: 1..<(location.activities!.count - 1)))
            i += 1
        }
        
//        for date in datesInLocation! {
        var n = 1
        while n <= location.duration {
            for randomInt in randomIntsforActvities!{
                allThingsinLocationArray.append(location.activities![randomInt])
            }
            n += 1
        }
//        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip!.cities![rowClicked!].activities!.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         allActivitiesinLocation(location: trip!.cities![rowClicked!])
        let cell:CityDayCustomCell = self.cityTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CityDayCustomCell
        let activity = allThingsinLocationArray[indexPath.row]
                cell.activity = activity
                return cell
    }
}
