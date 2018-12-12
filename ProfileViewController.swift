//
//  ProfileViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/3/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseStorage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileLB: UILabel!
    @IBOutlet weak var addBookBT: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addPhoto: UIButton!
    
    //var imagePicker: UIImagePickerController!
    
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let username = Auth.auth().currentUser?.displayName
        profileLB.text = "\(username!)'s Profile"
        
        /*
        imagePicker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true */
        
    }
    
    /* func setUser() {
        let userData = [
            "username" = username!
        ]
        let location = Database.database().reference().child("users").child(userUID)
        location.setValue(userData)
        dismiss(animated: true, completion: nil)
    } */
    
    /* func uploadImg() {
        
        let img = profileImage.image
        
        if let imgData = UIImageJPEGRepresentation(img!, 0.2) {
            let imgUID = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            Storage.storage().reference().child(imgUID).putData(imgData, metadata: metadata) { (metadata, error) in
                if error != nil {
                    print("Did not upload image")
                } else {
                    print("Image uploaded")
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                    if let url = downloadURL {
                        self.setUser(img: url)
                    }
                }
            }
        }
    } */
    
    /* @IBAction func selectedImgPicker (_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    } */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
