//
//  ViewController.swift
//  songPlayer
//
//  Created by the Soo-Rae's Mac on 7/14/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer = AVAudioPlayer()


    @IBAction func play(sender: AnyObject) {
        player.play()
    }

    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    @IBAction func stop(sender: AnyObject) {
player.stop()
        player.currentTime = 0
        
    }
    @IBOutlet var sliderValue: UISlider!
    @IBAction func sliderChanged(sender: AnyObject) {
        player.volume = sliderValue.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var audioPath = NSBundle.mainBundle().pathForResource("losing-you", ofType: "mp3")
        var error:NSError? = nil
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

