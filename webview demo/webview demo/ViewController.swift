//
//  ViewController.swift
//  webview demo
//
//  Created by the Soo-Rae's Mac on 7/16/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      /*  var url = NSURL(string: "http://www.google.com")
        var request = NSURLRequest(URL:url!)
        webview.loadRequest(request)
        */
        
        var html = "<html><head></head><body><h1>Hello world!</h1></body></html>"
        
        webview.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

