//
//  TripItineraryViewController.swift
//  BackpackingItineraryPlannerv2
//
//  Created by Riyo Perry on 7/25/19.
//  Copyright © 2019 Riyo Perry. All rights reserved.
//

//import Foundation
//import UIKit
//
//class TripItineraryViewController: UITableViewController{
//    
//    var tripName: String?
//    var trip: Trip?
//    let cellID = "cellId"
//    var locationNames = [String]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        for city in trip!.cities! {
//            locationNames.append(city.title)
//        }
//        
//        self.navigationItem.title = "Itinerary"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return locationNames.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        
//        let name = self.locationNames[indexPath.row]
//        cell.textLabel?.text = name
//        
//        return cell
//    }
//}
