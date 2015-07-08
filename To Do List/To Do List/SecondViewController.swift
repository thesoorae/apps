//
//  SecondViewController.swift
//  To Do List
//
//  Created by the Soo-Rae's Mac on 7/6/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{

    @IBOutlet weak var newTask: UITextField!
    
    @IBAction func addToList(sender: AnyObject) {
        toDoList.append(newTask.text)
        newTask.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
        
    }

