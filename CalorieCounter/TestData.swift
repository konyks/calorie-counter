//
//  TestData.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 12/3/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import Foundation
import Parse

class TestData {
    
//    
//    func displayF(){
//        self.displayGoal()
//        self.displayCurrent()
//        
//        var target = self.targetCal.description.toInt()
//        var current = self.currentCal.text
//        println(target)
//        println(current)
//        
//    }
//    
//    func displayGoal(){
//        var query = PFQuery(className:"personalData")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        query.findObjectsInBackgroundWithBlock() {
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        
//                        let self.ht = Double((object["height"] as! String).toInt()!)
//                        let age = (object["age"] as! String).toInt()!
//                        let gender = object["gender"] as! String
//                        
//                        let goal = self.goal.getBMR(weight, height: height, age: age, gender: gender)
//                        self.targetCal.text = String(goal)
//                    }
//                }
//            } else {
//                // Log details of the failure
//                println("Error: \(error!) \(error!.userInfo!)")
//            }
//        }
//        
//    }
//    
//    func displayCurrent(){
//        var query = PFQuery(className:"foodLog")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        var calories = 0
//                        var total = 0
//                        for object in objects{
//                            calories = (object["caloriesCount"] as! String).toInt()!
//                            total = total + calories
//                        }
//                        
//                        self.currentCal.text = String(total)
//                    }
//                }
//            } else {
//                // Log details of the failure
//                println("Error: \(error!) \(error!.userInfo!)")
//            }
//        }
//        
//    }
//    
//    func displayRemaining(){
//        var target = self.targetCal.text?.toInt()
//        var current = self.currentCal.text?.toInt()
//        println(target)
//        println(current)
//        //var remaining = target! - current!
//        
//        
//        //self.remainingCal.text = String(remaining)
//    }
//    
//    
//    
//    //Fuction to dispalay formula
//    func displayFormula(){
//        
//        //get the target calories count
//        let target = self.getGoal()
//        targetCal.text = String(target)
//        
//        //display current callories count
//        let current = self.getCurrent()
//        currentCal.text = String(current)
//        
//        //display remaining calories
//        let remaining = target - current
//        remainingCal.text = String(remaining)
//        
//    }
//    
//    //Function to get goal calories intake for a day
//    func getGoal() -> Int
//    {
//        var target = 0
//        var weight = 0.0
//        var height = 0.0
//        var age = 0
//        var gender = ""
//        
//        let query = PFQuery(className: "personalData")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        let objectArray = query.findObjects()
//        if let objectArray = objectArray as? [PFObject]{
//            for object in objectArray{
//                weight = Double((object["weight"] as! String).toInt()!)
//                height = Double((object["height"] as! String).toInt()!)
//                age = (object["age"] as! String).toInt()!
//                gender = object["gender"] as! String
//            }
//        }
//        
//        target = self.goal.getBMR(weight, height: height, age: age, gender: gender)
//        
//        return target
//    }
//    
//    //Function to get current callories count
//    func getCurrent() -> Int{
//        var total = 0
//        var calories = 0
//        
//        let query = PFQuery(className: "foodLog")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        let objectArray = query.findObjects()
//        
//        if let objectArray = objectArray as? [PFObject]{
//            for object in objectArray{
//                calories = (object["caloriesCount"] as! String).toInt()!
//                total = total + calories
//            }
//        }
//        
//        return total
//    }
//    
//    //Function to retrive and display the name of a user
//    func displayName(){
//        //get user name
//        let name = PFUser.currentUser()!.username
//        userName.text = name
//    }
//    
//    //Function to get today`s date
//    func getDate()->NSString{
//        let currentDate = NSDate();
//        
//        var formatter = NSDateFormatter();
//        formatter.dateFormat = "yyyy-MM-dd";
//        let formattedDate = formatter.stringFromDate(currentDate);
//        
//        return formattedDate
//    }
}
