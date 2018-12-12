//
//  messageDetailCell.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/19/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class messageDetailCell: UITableViewCell {
    
    //@IBOutlet weak var recipientImg: UIImageView!
    @IBOutlet weak var recipientName: UILabel!
    @IBOutlet weak var chatPreview: UILabel!
    
    var messageDetail: MessageDetail!
    var userPostKey: DatabaseReference!
    var currentUser = Auth.auth().currentUser?.displayName

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(messageDetail: MessageDetail) {
        self.messageDetail = messageDetail
        let recipientData = Database.database().reference().child("users").child(messageDetail.recipient)
        recipientData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            let username = data["username"]
            //let userImg = data["userImg"]
            self.recipientName.text = username as? String
            /* let ref = Storage.storage().reference(forURL: userImg! as! String)
             ref.data(withMaxSize: 100000, completion: { (data, error) in
                if error != nil {
                    print("Could not load image")
                } else {
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.recipientImg.image = img
                    }
                  }
                }
            }) */
        })
    }
}
