//
//  ViewController.swift
//  core data demo
//
//  Created by the Soo-Rae's Mac on 7/15/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
 //var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
   //    newUser.setValue("thesoorae", forKey: "username")
     //newUser.setValue("pickle", forKey: "password")
//   context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
       request.predicate = NSPredicate(format: "username = %@", "kerstin")
        var results = context.executeFetchRequest(request, error: nil)
        if results?.count > 0 {
            println(results)
        for result:AnyObject in results! {
            if let user = result.valueForKey("username") as? String {
                if user == "kerstin" {
               //     context.deleteObject(result as! NSManagedObject)
                //    println(user + " has been deleted")
                    result.setValue("newpassword", forKey: "password")
                }
                
                    
                
            }
            context.save(nil)
            } } else{
                println("no results")}
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

