//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var signupActive = true
    
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var secondaryButton: UIButton!
    @IBOutlet var secondaryText: UILabel!
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        if username.text == "" || password.text == "" {
            displayAlert("Error Form", message: "Please enter a username and password")
            
        } else {
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
           
            var errorMessage = "Please try again later"

            if signupActive == true {
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text

            
            user.signUpInBackgroundWithBlock{(success, error) -> Void in
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
                if error == nil {
                    //signup successful
                    self.performSegueWithIdentifier("login", sender: self)
                } else {
                    if let errorString = error!.userInfo?["error"] as? String {
                       errorMessage = errorString
                    }
                    self.displayAlert("Failed Sign up", message:errorMessage)
                }
                }} else {
                    PFUser.logInWithUsernameInBackground(username.text, password: password.text, block: {(user, error) -> Void in
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                            if user != nil {
                                println("logged in")
                                //logged in successfully
                                self.performSegueWithIdentifier("login", sender: self)
                                
                            } else {
                                if let errorString = error!.userInfo?["error"] as? String {
                                    errorMessage = errorString }
                                
                                self.displayAlert("Login Error", message: errorMessage)
                            }
                        })
            }}}

    
    
    @IBAction func logIn(sender: AnyObject) {
        if signupActive == true {
            mainButton.setTitle("Log In", forState: UIControlState.Normal)
            secondaryText.text = "Not registered?"
            
        secondaryButton.setTitle("Sign Up", forState: UIControlState.Normal)
        signupActive = false
        } else {
            mainButton.setTitle("Sign Up", forState: UIControlState.Normal)
            secondaryText.text = "Already registered?"
            
            secondaryButton.setTitle("Log In", forState: UIControlState.Normal)
            signupActive = true

        }
        }
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
        if PFUser.currentUser()?.username != nil {
            self.performSegueWithIdentifier("login", sender: self)
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

