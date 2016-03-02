//
//  CaptureViewController.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/2/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    var image = UIImage()
    
    @IBOutlet weak var captionField: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAddImage(sender: AnyObject) {
        print("add image button clicked")
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        print("Image picker vc displayed")
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func saveToCamera(image: UIImage?) {
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            image = originalImage
            saveToCamera(image)
            dismissViewControllerAnimated(true, completion: nil)
            self.userImageView.image = image
    }
    
    @IBAction func onPhotosSelected(sender: AnyObject) {

        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSubmitImage(sender: AnyObject) {
        print("Submit button clicked")
        
        let newImage = Post.resize(image, newSize: CGSize(width: 300, height: 500))
        Post.postUserImage(newImage, withCaption: captionField.text) { (success: Bool, error: NSError?) -> Void in
            self.tabBarController?.selectedIndex = 0
        }
        self.tabBarController?.selectedIndex = 0
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
