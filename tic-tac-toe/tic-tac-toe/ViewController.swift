//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by the Soo-Rae's Mac on 7/8/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var turnindicator: UILabel!
var turn="x"
var row=false
    
    func check(first:UILabel, second:UILabel, third:UILabel, player: String){
        if first.text==player && second.text==player && third.text==player {
            row=true
            turnindicator.text="\(player) wins!"
        }
    }
    
    func inARow(x:String){
        check(A1label, second: A2label, third: A3label, player: x)
        check(B1label, second: B2label, third: B3label, player: x)
         check(C1label, second: C2label, third: C3label, player: x)
        check(A1label, second: B1label, third: C1label, player: x)
        
        check(A2label, second: B2label, third: C2label, player: x)
        check(A3label, second: B3label, third: C3label, player: x)
            check(A1label, second: B2label, third: C3label, player: x)
        check(A3label, second: B2label, third: C1label, player: x)

    }

    
    func changeLabel(label:UILabel){
        if label.text==""{
        if turn=="x" {
            label.text="X"
        turn = "o"}
        else {label.text="O"
        turn = "x"}
        turnindicator.text="\(turn)'s turn"
        inARow("X")
            inARow("O")}
    
    }
    
   
    @IBOutlet var A1label: UILabel!
    @IBOutlet var B1label: UILabel!
    @IBOutlet var C1label: UILabel!
    @IBOutlet var A2label: UILabel!
    @IBOutlet var B2label: UILabel!
    @IBOutlet var C2label: UILabel!
    @IBOutlet var A3label: UILabel!
    @IBOutlet var B3label: UILabel!
    @IBOutlet var C3label: UILabel!
    @IBAction func A1button(sender: AnyObject) {
        changeLabel(A1label)
    }
    @IBAction func B1button(sender: AnyObject) {
        changeLabel(B1label)
    }
    @IBAction func C1button(sender: AnyObject) {
    changeLabel(C1label)
    }
    @IBAction func A2button(sender: AnyObject) {
    changeLabel(A2label)
    }
    @IBAction func B2button(sender: AnyObject) {
changeLabel(B2label)
    }
    @IBAction func C2button(sender: AnyObject) {
    changeLabel(C2label)
    }
    @IBAction func A3button(sender: AnyObject) {
    changeLabel(A3label)
    }
    @IBAction func B3button(sender: AnyObject) {
    changeLabel(B3label)
    }
    @IBAction func C3button(sender: AnyObject) {
    changeLabel(C3label)
    }
    
    func reset(label:UILabel){label.text=""}
    @IBAction func restart(sender: AnyObject) {
        reset(A1label)
        reset(A2label)
        reset(A3label)
        reset(B1label)
        reset(B2label)
        reset(B3label)
        reset(C1label)
        reset(C2label)
        reset(C3label)
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

