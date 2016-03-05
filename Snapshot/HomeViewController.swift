//
//  HomeViewController.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/1/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [PFObject]?
    
    //let center = NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableView", name: imageDataSetNotification, object: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("View did load called")
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        // construct PFQuery and get data from Parse
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // print(posts)
                self.photos = posts
                self.tableView.reloadData()
                
                // is this called?
            } else {
                print("ERROR: unable to get photos from parse")
            }
        }

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        print("View will appear called")
        getData()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        if (photos != nil) {
            let object = photos![indexPath.row]
            
            cell.object = object
            
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
