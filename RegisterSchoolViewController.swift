//
//  RegisterSchoolViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 8/28/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterSchoolViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var positionTF: UITextField!
    @IBOutlet weak var schoolTF: UITextField!
    @IBOutlet weak var signupBT: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        
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
