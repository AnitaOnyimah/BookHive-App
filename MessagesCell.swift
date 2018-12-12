//
//  MessagesCell.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/24/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseStorage

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var receivedMessageLbl: UILabel!
    @IBOutlet weak var receivedMessageView: UIView!
    @IBOutlet weak var sentMessageLbl: UILabel!
    @IBOutlet weak var sentMessageView: UIView!
    var message: Message!
    var currentUser = Auth.auth().currentUser?.displayName
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(message: Message) {
        self.message = message
        if message.sender == currentUser {
            sentMessageView.isHidden = false
            sentMessageLbl.text = message.message
            receivedMessageLbl.text = ""
            receivedMessageLbl.isHidden = true
        } else {
            sentMessageView.isHidden = true
            sentMessageLbl.text = ""
            receivedMessageLbl.text = message.message
            receivedMessageLbl.isHidden = false
        }
    }
}
