//
//  ViewController.swift
//  randomMusicGenerator
//
//  Created by the Soo-Rae's Mac on 7/15/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var index = 0
    var songs = ["turn-down-for-what", "it-is-what-it-is", "raindrops"]
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            index = Int(arc4random_uniform(3))
            var audioPath = NSBundle.mainBundle().pathForResource(songs[index], ofType: "mp3")
            var error:NSError? = nil
            player = AVAudioPlayer(contentsOfURL: NSURL(string:audioPath!), error: &error)
            player.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

