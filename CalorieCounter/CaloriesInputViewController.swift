//
//  CaloriesInputViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/15/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class CaloriesInputViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate{
    
    //Properties for food input detail
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var caloriesAmount: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var mealType: String = ""
    
    var pickerDataSource = ["Breakfast", "Lunch", "Dinner", "Snacks"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        initializeTextFields()
        
    }
    
    //Function to initialize text fileds to only except numerical values
    func initializeTextFields() {
        caloriesAmount.delegate = self
        caloriesAmount.keyboardType = UIKeyboardType.NumberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)//Brackfast
        {
            mealType = "Breakfast"
        }
        else if(row == 1)//Lunch
        {
            mealType = "Lunch"
        }
        else if(row == 2)//Dinner
        {
            mealType = "Dinner"
        }
        else//Snacks
        {
            mealType = "Snacks"
        }
    }
    
    //Function to fodd details
    @IBAction func addCalories(sender: AnyObject) {
        
        if(foodName.text.isEmpty || caloriesAmount.text.isEmpty || mealType.isEmpty){
            //Output an Alert
            var alert = UIAlertView(title: "Data Required", message: "Please enter all required information", delegate: self, cancelButtonTitle: "OK")
            alert.show()

        }
        else{
            //Create a foodLog object in Parse
            var foodLog = PFObject(className: "foodLog")
            
            //Put user food detail into foodLog
            foodLog["foodName"] = foodName.text
            foodLog["caloriesCount"] = caloriesAmount.text
            foodLog["mealType"] = mealType
            foodLog["user"] = PFUser.currentUser()!
            
            //Save data
            foodLog.saveInBackground()
            
            //Output an alert informing a user that the passoword or username did not meet the requiraments
            var alert = UIAlertView(title: "Recorded", message: "Your calories were recorded", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
            //Redirect a user to a log view conroller
            self.navigationController?.popViewControllerAnimated(true)

        }
    }
}
