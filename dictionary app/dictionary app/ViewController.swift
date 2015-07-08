//
//  ViewController.swift
//  dictionary app
//
//  Created by the Soo-Rae's Mac on 7/8/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var word: UITextField!
    @IBOutlet var definition: UILabel!
    @IBAction func define(sender: AnyObject) {
        var url=NSURL(string: "http://www.merriam-webster.com/dictionary/" + word.text)
    if url != nil{
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {
              (data, response, error) -> Void in
              var urlError = false
            var defined=""
                if error==nil{
                 var urlContent = NSString(data:data, encoding:NSUTF8StringEncoding)
             println(urlContent)
                }})}              //var urlContentArray = urlContent!.componentsSeparatedByString("<div class=\"1d_on_collegiate\">")
//                    if urlContentArray.count > 1 {
  //                      var definitionArray=urlContentArray[1].componentsSeparatedByString("</div>")
    //                    defined = definitionArray[0] as! String
      //              println(defined)
        //            } else {
          //              urlError=true}}else{
            //        urlError=true
              //      }
                //    dispatch_async(dispatch_get_main_queue()){
                  //  if urlError == true{
                    //    self.showError()
                    //} else {
                      //  self.definition.text = defined
                       // }
                   // }
        }
     //   )
       //         task.resume()}
            
      //  else { showError()}}
    
        
    
    func showError(){
        definition.text = "Could not find definition for " + word.text
    }
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
        word.resignFirstResponder()
        return true}
}



