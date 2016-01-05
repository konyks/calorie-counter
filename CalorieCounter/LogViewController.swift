//
//  LogViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/14/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    
    var mealType:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to set up action for the X close button
    @IBAction func unwindToLogController(segue:UIStoryboardSegue) {
        
    }

    //Function to redirect a user to a table detail view when Lunch botton is pressed
    @IBAction func LunchPressed(sender: AnyObject) {
        mealType = "Lunch"
        self.performSegueWithIdentifier("logDetail", sender: self)
    }
    //Function to redirect a user to a table detail view when Breckfast botton is pressed
    @IBAction func BreckfastPressed(sender: AnyObject) {
        mealType = "Breakfast"
        self.performSegueWithIdentifier("logDetail", sender: self)
    }
    //Function to redirect a user to a table detail view when Snacks botton is pressed
    @IBAction func SnacksPressed(sender: AnyObject) {
        mealType = "Snacks"
        self.performSegueWithIdentifier("logDetail", sender: self)
    }
    //Function to redirect a user to a table detail view when Dinner botton is pressed
    @IBAction func DinnerPressed(sender: AnyObject) {
        mealType = "Dinner"
        self.performSegueWithIdentifier("logDetail", sender: self)
    }
    
    //Function to prepare and pass a value from a segway
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "logDetail") {
            //Pass a mealType value to TableViewController
            var svc = segue.destinationViewController as! TableViewController;
            svc.mealType = mealType
        }
    }
}
