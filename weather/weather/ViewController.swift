//
//  ViewController.swift
//  weather
//
//  Created by the Soo-Rae's Mac on 7/8/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var urltext=""
    
    @IBOutlet var weatherSummary: UILabel!
    @IBOutlet var city: UITextField!
    @IBAction func findWeather(sender: AnyObject) {  var url = NSURL(string: "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        if url != nil{
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) -> Void in
                var urlError = false
                var weather = "blab"
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    
                    var urlContentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                    if urlContentArray.count > 1{
                        var weatherArray=urlContentArray[1].componentsSeparatedByString("</span>")
                        weather = weatherArray[0] as! String
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString:"°")
                        
                    } else {
                        urlError = true
                    }
                } else {
                    urlError = true
                }
                dispatch_async(dispatch_get_main_queue()){
                    if urlError == true{
                        self.showError()
                    } else {
                        self.weatherSummary.text = weather
                    }
                }
            })
            task.resume()
            
            
        } else {showError()}
     
    }

    func showError(){
        weatherSummary.text = "Was not able to find weather for " + city.text}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        city.resignFirstResponder()
        return true}
    }

