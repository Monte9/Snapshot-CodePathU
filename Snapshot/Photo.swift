//
//  Photo.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/3/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse

let imageDataSetNotification = "imageDataSet";

class Photo: NSObject {
    
    var image: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    
    var cell: PhotoCell?
    
    
    init(object : PFObject) {
        
        super.init()
        
        // Create Parse object PFObject
        let newObject = object
        
        // Add relevant fields to the object
        //  author = newObject["author"] as! String
        caption = newObject["caption"] as! String
        likesCount = newObject["likesCount"] as! Int
        commentsCount = newObject["commentsCount"] as! Int
        
        if let newImage = object.valueForKey("media")! as? PFFile {
            
            newImage.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data: imageData!)
                    self.image = image
                    self.cell?.photo = self;
                } else {
                    print("ERROR: could not get image \(error?.localizedDescription)")
                }
                }, progressBlock: { (int: Int32) -> Void in
            })
        }
    }
}
