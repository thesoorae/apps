//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    println("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
    }
    
    @IBOutlet var importedImage: UIImageView!
    @IBAction func importImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  /*      var product = PFObject(className: "Products")
        product["name"]="Ice Cream"
        product["description"]="Tutti Frutti"
        product["price"]=4.99
        product.saveInBackgroundWithBlock{(success, error) -> Void in
            if(success == true){
                println("Object saved with ID \(product.objectId)")
            } else {
println("failed")
                println(error)
            
            }
            }

        var query = PFQuery(className: "Products")
        query.getObjectInBackgroundWithId("NqwHHUEQRH", block: {(object, error) -> Void in
            if error != nil {
                println(error)}
            else if let product = object{
            product["description"]="Rocky Road"
                product["price"] = 5.99
                product.saveInBackground()

            }
            }) */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

