//
//  AddTaskViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditTaskElementViewControllerDelegate {

    var tableView : UITableView!
    var inputs : [String]!
    var headers = ["Title", "Description", "Type", "Paid?", "Estimated Time", "Completion By", "Preferred Contact Info"]
    
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
        if indexPath.section < 7 {
            cell.textLabel?.text = inputs[indexPath.section]
        }
        else {
            cell.textLabel?.text = "Submit"
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row < 7 {
            var etevc : EditTaskElementViewController = EditTaskElementViewController()
            
            etevc.item = indexPath.section
            etevc.selectedElement = headers[indexPath.section]
            etevc.currentData = inputs[indexPath.section]
            etevc.delegate = self
            
            
            self.navigationController?.pushViewController(etevc, animated: true)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section < 7 {
            return headers[section]
        }
        else {
            return "Add it!"
        }
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row < 7
    }
    
    func controller(controller: EditTaskElementViewController, addedElement: String, indexValue: Int) {
        inputs[indexValue] = addedElement
        tableView.reloadData()
    }
    
}
