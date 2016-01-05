//
//  TabBarViewController.swift
//  CalorieCounter
//
//  Created by Serhiy Konyk on 11/3/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import Parse

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Hide the back button so user can not come back to the sign in screen
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //self.navigationController?.navigationBarHidden = false

    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToLogScreen(segue:UIStoryboardSegue) {
    }
    
    //Function to log out a user
    @IBAction func logOut(sender: AnyObject) {
        // Send a request to log out a user
        PFUser.logOut()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        })
    }

}
