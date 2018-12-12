//
//  RegisteredViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 8/28/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisteredViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** Label displays username ***
        let username = Auth.auth().currentUser?.displayName
        myLabel.text = "Hello \(username!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "LoggedOut", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
