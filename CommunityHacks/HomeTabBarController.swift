//
//  HomeTabBarController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

// View Controller that will house all other View Controllers via UITabBarView
class HomeTabBarController : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        // add TasksViewController
        let tasks = UINavigationController(rootViewController: TasksViewController())
        let tasksIcon = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 1)
        tasks.tabBarItem = tasksIcon
        
        let profile = UINavigationController(rootViewController: ProfileViewController())
        let profileIcon = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)
        profile.tabBarItem = profileIcon
        
        let controllers = [tasks, profile]
        self.viewControllers = controllers
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
