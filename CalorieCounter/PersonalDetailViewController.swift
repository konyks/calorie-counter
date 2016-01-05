//
//  PersonalDetailViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/3/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class PersonalDetailViewController: UIViewController, UITextFieldDelegate {
    
    //Properties to store user`s personal information
    @IBOutlet weak var genderPicker: UISegmentedControl!
    @IBOutlet weak var ageTextFiled: UITextField!
    @IBOutlet weak var weightTextFiled: UITextField!
    @IBOutlet weak var feetTextFiled: UITextField!
    @IBOutlet weak var inchesTextFileld: UITextField!
    var gender:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide the navigation bar
        self.navigationController?.navigationBarHidden = true
        
        initializeTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to initialize text fileds to only except numerical values
    func initializeTextFields() {
        ageTextFiled.delegate = self
        ageTextFiled.keyboardType = UIKeyboardType.NumberPad
        
        weightTextFiled.delegate = self
        weightTextFiled.keyboardType = UIKeyboardType.NumberPad
        
        feetTextFiled.delegate = self
        feetTextFiled.keyboardType = UIKeyboardType.NumberPad
    
        inchesTextFileld.delegate = self
        inchesTextFileld.keyboardType = UIKeyboardType.NumberPad
    }
    
    //MARK: User actions
    
    //Function to record personal data which will be used in calculating the BMR for the day
    @IBAction func getPersonalInfo(sender: AnyObject) {
        //Check if information was entered by a user
        if(gender.isEmpty || ageTextFiled.text.isEmpty || weightTextFiled.text.isEmpty || feetTextFiled.text.isEmpty || inchesTextFileld.text.isEmpty){
            //Output an alert informing a user that to enter data
            var alert = UIAlertView(title: "Data Required", message: "Enter all required infomration", delegate: self, cancelButtonTitle: "OK")
            alert.show()

        }
        else{
            var height = (feetTextFiled.text.toInt()!*12) + inchesTextFileld.text.toInt()!
            
            //Create a parse object called personalData
            var personalData  = PFObject(className: "personalData")
            
            //Imput users data into the object
            personalData["gender"] = gender
            personalData["age"] = ageTextFiled.text
            personalData["weight"] = weightTextFiled.text
            personalData["height"] = String(height)
            personalData["user"] = PFUser.currentUser()!
            
            //Save the object
            personalData.saveInBackground()
            
            //Display alert window, informing a user about sucess
            var alert = UIAlertView(title: "Registered", message: "Success", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
            
            //Redirect a user to home screen
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UINavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UINavigationController
                self.presentViewController(viewController, animated: true, completion: nil)
            })
            }
    }

    @IBAction func chooseGender(sender: AnyObject) {
        if (genderPicker.selectedSegmentIndex == 0){
            self.gender = "Male"
        }
        else{
            self.gender = "Female"
        }
    }

}
