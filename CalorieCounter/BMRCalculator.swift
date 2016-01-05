//  BMRCalculator.swift
//  Claculates the BMR Index for a person based on:
//      * Height
//      * Weight
//      * Gender
//      * Age
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/7/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import Foundation

class BMRCalculator {
    
    init() {
        var weight: Double = 0.0
        var height: Double = 0.0
        var age: Int = 0
        var gender: String = ""
    }
    
    // Function to get a BMR daily calories intake, based on:
    // Weight, Height, Age, and Gender
    func getBMR(weight:Double, height:Double, age:Int, gender: String)->Int{
        //Declare local variables
        var BMR = 0.0
        var weightCalculation = 0.0
        var heightCalculation = 0.0
        var ageCalculaition = 0.0
        
        //If Gender is Male, use the following formula: BMR=66.47+ (13.75 x W) + (5.0 x H) - (6.75 x A)
        if gender == "Male" {
            weightCalculation = 13.75 * toKilograms(weight)
            heightCalculation = 5.0 * toCentimeters(height)
            ageCalculaition = 6.75 * Double(age)
            
            BMR = 66.47 + weightCalculation  + heightCalculation - ageCalculaition
            
            return Int(BMR)
        }
        //Else Gender is Female, use the following formula: BMR=665.09 + (9.56 x W) + (1.84 x H) - (4.67 x A)
        else{
            weightCalculation = 9.56 * toKilograms(weight)
            heightCalculation = 1.84 * toCentimeters(height)
            ageCalculaition = 4.67 * Double(age)
            
            BMR =  665.09 + weightCalculation + heightCalculation - ageCalculaition
            
            return Int(BMR)
        }
    }
    
    //Formula to calculate remaining calories
    func getRemaining(goal: Int, current: Int)->Int{
        var remaining = goal - current
        if remaining < 0 {
            remaining = 0
        }
        return remaining
    }
    
    // Function to convert from pounds to killograms
    private func toKilograms(weight:Double)->Double{
        return weight/2.2
    }
    
    // Function to convert from inches into centemiters
    private func toCentimeters(height:Double)->Double{
        return height*2.54
    }
    
}
