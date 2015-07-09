//
//  ViewController.swift
//  animation
//
//  Created by the Soo-Rae's Mac on 7/8/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer=NSTimer()
    var count=0
    var isAnimating=false

    @IBOutlet var pugImage: UIImageView!
    
    @IBOutlet var why: UILabel!
   
    @IBAction func explode(sender: AnyObject) {
        timer.invalidate()
    pugImage.image=UIImage(named:"sadpug.jpg")
   why.text="whyyyyyyyyy???" }
    
    func result(){
        if count == 3 {count = 1}
        else {count++}
        pugImage.image = UIImage(named:"frame\(count).png")}
    
    @IBAction func updateImage(sender: AnyObject) {
        why.text=" "
        if isAnimating == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        isAnimating=true} else {timer.invalidate()
            isAnimating = false}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    pugImage.image=UIImage(named:"frame1.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    override func viewDidLayoutSubviews() {
        pugImage.frame = CGRectMake(100, 20, 0, 0)
    }
    override func viewDidAppear(animated:Bool){
        UIView.animateWithDuration(1, animations: {() -> Void in
            self.pugImage.frame = CGRectMake(100, 20, 100,200) })}
    */
    }


