//
//  TasksViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddTaskViewControllerDelegate {

    var tableView : UITableView!
    var toolbar : UIToolbar!
    var tasks : NSMutableArray!
    
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
        
        var addTaskBarButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addItem:")
        self.navigationItem.rightBarButtonItem = addTaskBarButton
        
        toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: screenHeight - 50, width: screenWidth, height: 50)
        
        var bottomBarButtons : [AnyObject] = []
        bottomBarButtons.append(UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: nil, action: "logOut:"))
        self.toolbar.items = bottomBarButtons
        
        tasks = []
        
        view.addSubview(toolbar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = tasks[indexPath.row][0] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func logOut(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("username")
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    func addItem(sender: UIButton!) {
        println("Made it to addItem method")
        var atvc : AddTaskViewController = AddTaskViewController()
        atvc.delegate = self
        self.navigationController?.pushViewController(atvc, animated: true)
    }
    
    func addTask(controller: AddTaskViewController, item: [String]) {
        tasks.addObject(item)
        tableView.reloadData()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
