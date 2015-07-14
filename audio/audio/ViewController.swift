//
//  ViewController.swift
//  audio
//
//  Created by the Soo-Rae's Mac on 7/14/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBAction func slider(sender: AnyObject) {
        player.volume = sliderValue.value
        
    }
    
    
    
    @IBAction func play(sender: AnyObject) {
        
        var audioPath = NSBundle.mainBundle().pathForResource("losing-you", ofType: "mp3")!
            var error : NSError? = nil
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        if error == nil {
            player.play()
        } else {
            println(error)
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBOutlet var sliderValue: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

