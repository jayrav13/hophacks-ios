//
//  ViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var username : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var label : UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 50, width: screenWidth, height: 50)
        label.text = "Log In"
        label.textAlignment = NSTextAlignment.Center
        view.addSubview(label)
        
        username = UITextField()
        username.frame = CGRect(x: 50, y: 100, width: screenWidth - 100, height: 30)
        username.borderStyle = UITextBorderStyle.RoundedRect
        username.textAlignment = NSTextAlignment.Center
        view.addSubview(username)
        
        var button : UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRect(x: 100, y: 150, width: screenWidth - 200, height: 30)
        button.setTitle("Log In", forState: UIControlState.Normal)
        button.addTarget(self, action: "logIn:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        if let username = defaults.stringForKey("username") {
            segweyVC()
        }
    }
    
    func logIn(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(username.text, forKey: "username")
        
        segweyVC()
        
    }
    
    func segweyVC() {
        var navigationController : UINavigationController = UINavigationController(rootViewController: TasksViewController())
        self.presentViewController(navigationController, animated: true, completion: { () -> Void in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }


}

