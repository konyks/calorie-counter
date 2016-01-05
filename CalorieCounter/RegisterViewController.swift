//
//  RegisterViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/3/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {
    
    //Properties for user login credentials
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Activity Indicator
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide the navigation bar
        self.navigationController?.navigationBarHidden = true

        //Configure Activity Indicator
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: User actions
    
    //Function to register a user
    @IBAction func register(sender: AnyObject) {
        
        //Get needed registration information
        var username = self.usernameTextField.text
        var email = self.emailTextField.text
        var password = self.passwordTextField.text
        
        //Validation username and passoword(Username must be more then 4 characters and Password more then 5 characters)
        if(count(username.utf16) < 4 || count(password.utf16) < 5){
            var alert = UIAlertView(title: "Username/Password Requraments", message: "Username must be more then 4 and Password more then 5 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        //Validate email address
        else if (count(email.utf16) < 8){
            var alert = UIAlertView(title: "Email Requraments", message: "Please enter a valid email: ex: mail@mail.com", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            
            self.actInd.startAnimating()
            
            //Create a user with provided credentials
            var newUser = PFUser()
            
            newUser.username = username
            newUser.email = email
            newUser.password = password
            
            //Save a user and check if there are any errors returned by Parse
            newUser.signUpInBackgroundWithBlock({(sucess, error) -> Void in
                
                self.actInd.stopAnimating()
                
                //If there is an error returned by Parse, the user was already registered, and his information is present in Parse
                if ((error) != nil){
                    var alert = UIAlertView(title: "Error", message: "User already exists. Please try to choose different username.", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
                //Otherwise, redirect a user to get his personal information
                else{
                    //Redirect a user to home screen
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PersonalDetails") as! UIViewController
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                    //self.performSegueWithIdentifier("personalDetail", sender: self)
                }
            })
        }
    }
}
