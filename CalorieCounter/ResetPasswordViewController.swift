//
//  ResetPasswordViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/7/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {

    //Property for the email
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to reset password
    @IBAction func resetPassword(sender: AnyObject) {
        
        //Get user email
        var email = self.emailTextField.text
        
        //Validate if the email is valid
        if (count(email.utf16) < 8){
            var alert = UIAlertView(title: "Invalid", message: "Please enter a valid email", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            //Check if there was an error returned by Parse
            var error = PFUser.requestPasswordResetForEmail(email)

            //Dispaly a sucess message informing a user that the email was sent with reset password link
            if error == true{
                var alert = UIAlertView(title: "Success", message: "Ckeck your email inbox.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                //Redirect a user to log in screen
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            //Otherwise, inform a user that there are no such email in the system
            else{
                var alert = UIAlertView(title: "Error", message: "Your email is not found in the system. Please try again.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
}
