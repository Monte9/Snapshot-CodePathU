//
//  HomeViewController.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/1/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse

var photos: [Photo]?

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
        tableView.reloadData()
    }
    
    func getData() {
        
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        
//        // fetch data asynchronously
//        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
//            if let imageArray = media {
//                print("Number of images retrived: \(imageArray.count)")
//                print(imageArray)
//                self.gifs = Gif.gifsWithArray(responseDictionary["data"] as! [NSDictionary])
//            } else {
//                print(error?.localizedDescription)
//            }
//        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        if ((photos) != nil) {
            cell.PhotoView.image = photos![indexPath.row].media as! UIImage
            cell.captionField.text = "Add Image"
        }

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
