//
//  EditTaskElementViewController.swift
//  CommunityHacks
//
//  Created by Jay Ravaliya on 9/12/15.
//  Copyright (c) 2015 JRav. All rights reserved.
//

import UIKit

protocol EditTaskElementViewControllerDelegate {
    func controller(controller: EditTaskElementViewController, addedElement: String, indexValue: Int)
}

class EditTaskElementViewController: UIViewController {

    var item : Int!
    var selectedElement : String!
    var currentData : String!
    
    var textField : UITextField!
    var button : UIButton!
    
    var delegate : EditTaskElementViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        self.title = selectedElement
        
        textField = UITextField(frame: CGRect(x: 50, y: 100, width: screenWidth-100, height: 100))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        view.addSubview(textField)
        
        button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.setTitle("Submit", forState: UIControlState.Normal)
        button.addTarget(self, action: "addElement:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRect(x: screenWidth/2-100, y: 250, width: 200, height: 50)
        button.titleLabel?.textAlignment = NSTextAlignment.Center
        view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addElement(sender: UIButton!) {
        println("Submit button on EditTask ViewController pressed!")
        
        if let delegate = self.delegate {
            delegate.controller(self, addedElement: textField.text, indexValue: item)
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }
    
    
}
