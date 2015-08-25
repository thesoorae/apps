/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    var currentUser = PFUser.currentUser()?.username

    @IBAction func signIn(sender: AnyObject) {PFUser.logInWithUsernameInBackground(username.text, password:"mypass") {
        (user: PFUser?, error: NSError?) -> Void in
        if user != nil {
            println("logged in")
            
            self.performSegueWithIdentifier("showUsers", sender: self)
        } else {
           
                var user = PFUser()
                user.username = self.username.text
                user.password = "mypass"
            
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if error == nil {
                        println("signed up")
                        self.performSegueWithIdentifier("showUsers", sender: self)

                    } else {
            println(error)
        }
        }
        }}}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        }
    
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser()?.username != nil{
            self.performSegueWithIdentifier("showUsers", sender: self)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
