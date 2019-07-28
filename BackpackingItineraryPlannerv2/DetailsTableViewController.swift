//
//  DetailsTableViewController.swift
//  
//
//  Created by Riyo Perry on 7/28/19.
//

import UIKit
import MapKit

class DetailsTableViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    var tripName: String?
    var trip: Trip?
    var rowClicked: Int?
    //    var allThingsinLocationDictArray: [[Date:Any]] = []
    //    var datesInLocation: [Date]?
    var allThingsinLocationArray: [Activity] = []
    
    let cellReuseIdentifier = "ActivityCustomCell"
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        cityNameLabel.text = "Daily Itinerary for \(trip!.cities![rowClicked!].title)"
        
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
        var randomIntsforActvities: Array<Int> = []
        var i = 1
        var numberofActivtiesCountArray: Array<Int> = []
        var j = 0
        while j <= location.activities!.count - 1 {
            numberofActivtiesCountArray.append(j)
            j += 1
        }
        while i <= 4 {
            print("Number of activities in location: \(location.activities!.count)")
            let randomNumber = Int.random(in: 0..<(location.activities!.count - 1))
            print("random number: \(randomNumber)")
            randomIntsforActvities.append(randomNumber)
            i += 1
        }
        
        //        for date in datesInLocation! {
        var n = 1
        while n <= location.duration {
            for randomInt in randomIntsforActvities{
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
        let cell:CityDayCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CityDayCustomCell
        let activity = allThingsinLocationArray[indexPath.row]
        cell.activity = activity
        return cell
    }
}
