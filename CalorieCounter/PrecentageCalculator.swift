//
//  PrecentageCalculator.swift
//  Class to calculate precentage for the pie chart
//  CalorieCounter
//
//  Created by Serhiy Konyk on 12/4/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import Foundation
import Charts

class PrecentageCalculator {
    //Properties
    var currentP: Double
    var remainingP: Double
    
    init(){
        currentP = 0.0
        remainingP = 0.0
    }
    //Function to get current precentage for graph
    func getCurrentPrecentage(total: Double, target: Double)->Double{
        currentP = (total/target)*100.00
        return currentP
    }
    
    //Function to get remaing precentage for graph
    func getRemainingPrecentage(remaining: Double, target: Double)->Double{
        
        remainingP = (remaining/target)*100.00
        
        if(remainingP < 0){
            remainingP = 0.00
        }
        
        return remainingP
    }

}
