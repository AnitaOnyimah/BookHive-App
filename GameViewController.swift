//
//  GameViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 8/23/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseStorage

class GameViewController: UIViewController {
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    var userUID: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func setUser(img: String) {
        let userData = [
            "username": usernameTF.text!,
            "userImg": img
        ]
        let location = Database.database().reference().child("users").child(userUID)
        location.setValue(userData)
        dismiss(animated: true, completion: nil)
    }
    
     override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
          //**** Auto-Login Code ****
          if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "SuccessSegue", sender: nil)
        }
    }
    
    /* func uploadImg() {
        let img = userImage.image
        if let imgData = UIImageJPEGRepresentation(img!, 0.2) {
            let imgUid = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            //let imageName = [UUID().uuidString, String(Date().timeIntervalSince1970)].joined()
            /*Storage.storage().reference().child(imgUid).putData(imgData, metadata: metadata) { (metadata, error) in
                completion(metadata?.downloadURL())
            } */
            /*Storage.storage().reference().child(imgUid).putData(imgData, metadata: metadata) { (metadata, error) in
                if error != nil {
                    print("did not upload img")
                } else {
                    print("uploaded")
                    //DO SOMETHING HERE
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                    if let url = downloadURL {
                        self.setUser(img: url)
                    }
                }
            } */
        
    }
} */
    
    // **** Makes keyboard disappear after use ****
    @IBAction func PressedRegister(_ sender: Any) {
        self.usernameTF.resignFirstResponder()
        self.passwordTF.resignFirstResponder()
    }
    
    // **** When Register is pressed ****
    @IBAction func handleRegister(_ sender: Any) {
        
        // **** Makes sure that all text fields are filled out ****
        guard let username = usernameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Some info is missing!", message: "Please fill out all fields.")
                return
        }
        
        // **** Creates the user with email/password ****
        Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
            
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard user != nil else { return }
        
        // **** This changes/manipulates the person's username ****
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = self.usernameTF.text
            changeRequest?.commitChanges{error in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "SuccessSegue", sender: nil)
            }
        })
    }
    
    // **** When Login is pressed ****
    @IBAction func handleLogin(_ sender: Any) {
        guard let username = usernameTF.text,
            username != "",
            let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != ""
            else {
                AlertController.showAlert(self, title: "Some info is missing!", message: "Please fill out all fields.")
                return
        }
        
        // **** Signs in user with email/password ****
        Auth.auth().signIn(withEmail: email, password: password, completion: { user, error in
            
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard user != nil else { return }
            
            self.performSegue(withIdentifier: "SuccessSegue", sender: nil)
        })
    }    
    
    
    // Literally no idea what this is lmao
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
