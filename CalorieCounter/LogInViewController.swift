//
//  LogInViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/2/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
    
    //Properties of user log in credentials
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Create an activity indicator
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //Hide the navigation bar
        self.navigationController?.navigationBarHidden = true
        
        //Configure activity indicator
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
        //Delete usercredentials if present
        usernameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //This is implemented in the case when user is logging out
        //Delete usercredentials if present
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to set up action for the X close button
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
    }
    
    //Function to dismiss keyboared when touched outside
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: -User Actions
    
    //Function to authonticate a user
    @IBAction func login(sender: AnyObject) {
        //Get a username
        var username = self.usernameTextField.text
        //Get a password
        var password = self.passwordTextField.text
        
        //Validate entered username and password. (username should be more then 4 chars, and password should be more then 5 chars)
        if(count(username.utf16) < 4 || count(password.utf16) < 5){
            //Output an alert informing a user that the passoword or username did not meet the requiraments
            var alert = UIAlertView(title: "Invalid", message: "Username must be more then 4 and Password more then 5 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            self.actInd.startAnimating()
            
            //Sign in a user with provided credentials
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                //If user was sucessfuly signed in, display a pop up alert message
                if((user) != nil){
                    var alert = UIAlertView(title: "Welcome", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                    alert.show()

                    //Redirect a user to home screen
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UINavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UINavigationController
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                }
                //Otherwise inform a user that the password or username was incorrect and he should try again
                else{
                    var alert = UIAlertView(title: "Error: Invalid Login Parameters", message: "Please check your username or password and try again", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
            })
        }
    }
}
