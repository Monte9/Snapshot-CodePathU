//
//  LoginViewController.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/1/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passworkField: UITextField!
    
    @IBOutlet var customView: UIView!
    
    
    
//    hud.mode = MBProgressHUD
//    //MBProgressHUDModeAnnularDeterminate
//    hud.labelText = "Loading"
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onLogin(sender: AnyObject) {
        
        let username = usernameField.text ?? ""
        let password = passworkField.text ?? ""
        
        
        //Show HUD progress bar
        var loadingHUD = MBProgressHUD.showHUDAddedTo(
            self.view, animated: true)
        loadingHUD.mode = MBProgressHUDMode.Indeterminate
        loadingHUD.labelText = "Welcome!"

        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                MBProgressHUD.hideHUDForView(self.view, animated: true)
            }
        }
    }
    
    @IBAction func onSignup(sender: AnyObject) {
        let user = PFUser()
        
        user.username = usernameField.text
        user.password = passworkField.text
        
        //Show HUD progress bar
        var loadingHUD = MBProgressHUD.showHUDAddedTo(
            self.view, animated: true)
        loadingHUD.mode = MBProgressHUDMode.AnnularDeterminate
        loadingHUD.labelText = "Deep breath!"
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("new user created")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                MBProgressHUD.hideHUDForView(self.view, animated: true)
            } else {
                print("ERROR: " + (error?.localizedDescription)!)
            }
        }
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
