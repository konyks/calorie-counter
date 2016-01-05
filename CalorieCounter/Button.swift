//
//  Button.swift
//  Class for a custom round bottons.
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/14/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//
//  Based on: http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
import UIKit

@IBDesignable
class Button: UIButton {
    
    //Properties of button
    @IBInspectable var changeColor: UIColor = UIColor.greenColor()
    @IBInspectable var changeTextColor: UIColor = UIColor.whiteColor()
    @IBInspectable var isEmpty: Bool = true
    
    //Draw button`s shape
    override func drawRect(rect: CGRect) {
        
        var path = UIBezierPath(ovalInRect: rect)
        changeColor.setFill()
        path.fill()
        
        //Get data to create plus button
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        var plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        if !isEmpty {
            //Draw the add button
            
            //Set horizontal line
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2 - plusWidth/2 + 0.5,
                y:bounds.height/2 + 0.5))
            

            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + plusWidth/2 + 0.5,
                y:bounds.height/2 + 0.5))
            
            //move to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 - plusWidth/2 + 0.5))
            

            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusWidth/2 + 0.5))
            
            //set color of the lines
            changeTextColor.setStroke()
            
            //draw the lines
            plusPath.stroke()
        }
    }
}