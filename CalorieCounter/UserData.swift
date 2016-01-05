//
//  UserData.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/26/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//
//
//import Foundation
//import Parse
//import UIKit
//
//extension NSDate {
//    func xDays(x:Int) -> NSDate {
//        return NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitDay, value: x, toDate: self, options: nil)!
//    }
//}
//
//class UserData {
//    
//    var target: Int
//    var weight: Double
//    var height: Double
//    var age: Int
//    var total: Int
//    var gender: String
//    var goal: BMRCalculator
//    
//    init(){
//        target = 0
//        weight = 0.0
//        height = 0.0
//        age = 0
//        total = 0
//        gender = ""
//        
//        goal = BMRCalculator()
//    }
//    
//    //Function to load personal data
//    func getTarget() -> Int
//    {
//
//        let query = PFQuery(className: "personalData")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        let objectArray = query.findObjects()
//        if let objectArray = objectArray as? [PFObject]{
//            for object in objectArray{
//                self.weight = Double((object["weight"] as! String).toInt()!)
//                self.height = Double((object["height"] as! String).toInt()!)
//                self.age = (object["age"] as! String).toInt()!
//                self.gender = object["gender"] as! String
//            }
//        }
//        
//        target = self.goal.getBMR(weight, height: height, age: age, gender: gender)
//        
//        return target
//    }
//    
//    //Function to load calories data
//    func getCurrent() -> Int {
//        var calories = 0
//        total = 0
//        
//        let query = PFQuery(className: "foodLog")
//        query.whereKey("user", equalTo:PFUser.currentUser()!)
//        //query.whereKey("createdAt", equalTo: self.getDate())
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
//    func getRemaining() -> Int{
//        return self.getTarget() - self.getCurrent()
//    }
//    
//    //Function to retrive and display the name of a user
//    func getUsername() -> String{
//        //get user name
//        let name = PFUser.currentUser()!.username
//        return name!
//    }
//    
//    //Function to get today`s date
//    func getDate()->NSDate{
//        
//        let today              = NSDate()
////        let yesterday          = NSDate().xDays(-1)
////        let dayBeforeYesterday = NSDate().xDays(-2)
//        
//        return today
//    }
//}
