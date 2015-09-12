//
//  ViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

// Initial View Controller
class ViewController: UIViewController {

    // All login page fields
    var label : UILabel!
    var username : UITextField!
    var button : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        // set up label
        label = UILabel()
        label.frame = CGRect(x: 0, y: 50, width: screenWidth, height: 50)
        label.text = "Log In"
        label.textAlignment = NSTextAlignment.Center
        view.addSubview(label)
        
        // set up username field
        username = UITextField()
        username.frame = CGRect(x: 50, y: 100, width: screenWidth - 100, height: 30)
        username.borderStyle = UITextBorderStyle.RoundedRect
        username.textAlignment = NSTextAlignment.Center
        view.addSubview(username)
        
        // set up button
        button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRect(x: 100, y: 150, width: screenWidth - 200, height: 30)
        button.setTitle("Log In", forState: UIControlState.Normal)
        button.addTarget(self, action: "logIn:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
                
    }
    
    // Check if user logged in when view appears.
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        if let username = defaults.stringForKey("username") {
            segweyVC()
        }
    }
    
    // Add username to NSUserDefaults upon login.
    func logIn(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(username.text, forKey: "username")
        segweyVC()
        
    }
    
    // Segway to next View Controller (non UINavigationController)
    func segweyVC() {
        self.presentViewController(HomeTabBarController(), animated: true, completion: { () -> Void in
            
        })
    }

    // Default functions:
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }


}

