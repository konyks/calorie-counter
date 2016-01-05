//
//  NavigationViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/2/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
        //Determine if a user is logged in and direct the user to appropriate views
        
        //If user is logged in, go to the home screen
        if ((PFUser.currentUser()) != nil){
            //go to home screen
            self.performSegueWithIdentifier("userSignedHome", sender: self)
        }
        //Else, user is not logged in, go to the log in screen
        else
        {
            //go to log in screen
            self.performSegueWithIdentifier("login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Function to dismiss keyboared when touched outside
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
