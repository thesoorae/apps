//
//  UploadPhoto.swift
//  ParseStarterProject
//
//  Created by the Soo-Rae's Mac on 7/23/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class UploadPhoto: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet var uploadedImage: UIImageView!
    @IBOutlet var imageDescription: UITextField!
    var activityIndicator = UIActivityIndicatorView()
    
   // var imageFile = PFFile()
    
    
    func displayAlert(title:String, message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    @IBAction func chooseImage(sender: AnyObject){
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        uploadedImage.image = image

    }
    
    @IBAction func postImage(sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        let userPhoto = PFObject(className: "savedImages")
        userPhoto["imageText"] = imageDescription.text
        userPhoto["user"] = PFUser.currentUser()!.objectId!
        let imageData = UIImagePNGRepresentation(uploadedImage.image)
        let imageFile = PFFile(name: "image.png", data: imageData)
        userPhoto["savedImages"] = imageFile
        userPhoto.saveInBackgroundWithBlock{(success, error) -> Void in
          
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if error == nil {
                self.displayAlert("image posted!", message:"your image has been posted successfully.")
                self.uploadedImage.image = UIImage(named: "placeholder3.png")
                self.imageDescription.text = ""
        } else {
                self.displayAlert("could not display image", message: "Please try again")}}}
    
    
    
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
        imageDescription.resignFirstResponder()
        return true}
    
}


