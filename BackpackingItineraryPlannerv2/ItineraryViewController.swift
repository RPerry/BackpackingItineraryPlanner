//
//  ItineraryViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/26/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

//import UIKit
//
//class ItineraryViewController: UITableViewController {
//
//        var tripName: String?
//        var trip: Trip?
//    
//}
//
//extension ItineraryViewController {
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return trip!.cities!.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
//        
//        let city = trip!.cities![indexPath.row]
//        cell.city = city
//        return cell
//        
//        
////        let formatter = DateFormatter()
////        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
////        let stringStartDate = formatter.string(from: city.startDate!)
////        let stringEndDate = formatter.string(from: city.endDate!)
////        let startDate = formatter.date(from: stringStartDate)
////        let endDate = formatter.date(from: stringEndDate)
////        formatter.dateFormat = "EEEE, MMM d, yyyy"
////        let myStartDateString = formatter.string(from: startDate!)
////        let myEndDateString = formatter.string(from: endDate!)
//    }
//}
//
