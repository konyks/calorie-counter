//
//  HomeViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/3/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse
import Charts

class HomeViewController: UIViewController {

    //Propertis of home screen
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var remainingCal: UILabel!
    @IBOutlet weak var currentCal: UILabel!
    @IBOutlet weak var targetCal: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    var bmr = BMRCalculator()
    var graph = PrecentageCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Disable the back botton on the home screen, so that user can not go back to the log in screen
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //Each time view loads display username
        userName.text = PFUser.currentUser()!.username
        
        //Display Formula
        self.showFormula()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //call view did load each time since the most recent data needs to be captured every time view appears
        self.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to clear user calorie data
    @IBAction func clearData(sender: AnyObject) {
        var refreshAlert = UIAlertController(title: "Warning", message: "Your your calorie data will be deleted.", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            let query = PFQuery(className: "foodLog")
            query.whereKey("user", equalTo:PFUser.currentUser()!)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        object.deleteEventually()
                    }
                    self.currentCal.text = "0"
                    self.remainingCal.text = self.targetCal.text
                }
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            self.view.reloadInputViews()
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    //Function to display Formula
    func showFormula(){
        //display goal bmr
        self.displayBMR()
        
        //display curent and remaining
        self.displayCurrentRemaining()
        
    }
    
    //Function to set and calculate BMR
    func displayBMR(){
        //Calculate and display BMR
        let query = PFQuery(className: "personalData")
        query.whereKey("user", equalTo:PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects{
                        var weight = Double((object["weight"] as! String).toInt()!)
                        var height = Double((object["height"] as! String).toInt()!)
                        var age = (object["age"] as! String).toInt()!
                        var gender = object["gender"] as! String
                        var total = self.bmr.getBMR(weight, height: height, age: age, gender: gender)
                        self.targetCal.text = String(total)
                    }
                }
            }else{
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    //Calculate and display Current and Remaining
    func displayCurrentRemaining()
    {
        //Calculate and display Current
        var query = PFQuery(className:"foodLog")
        query.whereKey("user", equalTo:PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let objects = objects as? [PFObject] {
            var calories = 0
            var total = 0
            for object in objects{
                calories = (object["caloriesCount"] as! String).toInt()!
                total = total + calories
            }
            
            self.currentCal.text = String(total)
            var target = 0
            if let tg = self.targetCal.text?.toInt(){
                target = tg
            }
            var remaining = self.bmr.getRemaining(target, current: total)
            self.remainingCal.text = String(remaining)
            
            //Calculate Precentage for the Pie Chart and set up variables
            var currentP = self.graph.getCurrentPrecentage(Double(total), target: Double(target))
            var remainingP = self.graph.getCurrentPrecentage(Double(remaining), target: Double(target))
            
            let values = ["Current", "Remaining"]
            let precentage = [currentP, remainingP]
            
            //Call a chart function
            self.setChart(values, values: precentage)
            }
        }

    }
    
    //Function to set the pie chart
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Count in %")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }

}
