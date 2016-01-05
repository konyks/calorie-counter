//
//  TableViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/15/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewController: PFQueryTableViewController {
    
    //Property used in sorting by meal type in table view
    var mealType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide the back button so user can not come back to the sign in screen
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "foodLog"
        self.textKey = "foodName"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view

    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "foodLog")
        query.orderByAscending("createdAt")
        query.whereKey("user", equalTo:PFUser.currentUser()!)
        query.whereKey("mealType", equalTo: mealType)
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let mealName = object?["foodName"] as? String {
            cell?.textLabel?.text = mealName
        }
        if let calories = object?["caloriesCount"] as? String {
            cell?.detailTextLabel?.text = "Calories: \(calories)"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //TODO: Implement a delete feature, so user can delete food entries
}
