//
//  AddTaskViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView!
    var inputs : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        inputs = [String](count: 7, repeatedValue: "")
        for x in 0...inputs.count - 1 {
            inputs[x] = ""
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        if indexPath.row < 7 {
            cell.textLabel?.text = inputs[indexPath.row]
        }
        else {
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Title"
        case 1:
            return "Description"
        case 2:
            return "Type"
        case 3:
            return "Paid?"
        case 4:
            return "Estimated Time"
        case 5:
            return "Completion By"
        case 6:
            return "Preferred Contact Info"
        default:
            return ""
        }
        
    }

    
    
}
