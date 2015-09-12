//
//  TasksViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView : UITableView!
    var toolbar : UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        self.title = "List of Hacks"
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 50)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        var addTaskBarButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = addTaskBarButton
        
        toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: screenHeight - 50, width: screenWidth, height: 50)
        
        var bottomBarButtons : [AnyObject] = []
        bottomBarButtons.append(UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: nil, action: "logOut:"))
        self.toolbar.items = bottomBarButtons
        
        view.addSubview(toolbar)
        
        println("Logged in!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func logOut(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("username")
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
}
