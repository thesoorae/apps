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
    
    var imageFile = PFFile()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageData = UIImagePNGRepresentation(pickedImage)
         imageFile = PFFile(data: imageData)
        PFUser.currentUser()?.saveInBackgroundWithBlock({ (success, error) -> Void in
            if error == nil {
                self.uploadedImage.image = pickedImage
            } else {
                println("error")
            }
        })
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func chooseImage(sender: AnyObject){
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func postImage(sender: AnyObject) {
        var imageDescriptionText:String = imageDescription.text
        var user = PFUser.currentUser()!
        let userPhoto = PFObject(className: "savedImages")
        userPhoto.setObject(imageDescriptionText, forKey:"imageText")
        userPhoto.setObject(imageFile,             forKey:"savedImages")
        userPhoto.setObject(user, forKey:"user")
        userPhoto.saveInBackground()
    
        
    //    PFUser.currentUser()?.setObject(userPhoto)

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
        imageDescription.resignFirstResponder()
        return true}
    
}


