//
//  MessageViewController.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/19/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageDetail = [MessageDetail]()
    var detail: MessageDetail!
    var recipient: String!
    var messageId: String!
    var currentUser = Auth.auth().currentUser?.displayName
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
    
        Database.database().reference().child("users").child(currentUser!).child("messages").observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                self.messageDetail.removeAll()
                for data in snapshot {
                    if let messageDict = data.value as? Dictionary<String, AnyObject> {
                        let key = data.key
                        let info = MessageDetail(messageKey: key, messageData: messageDict)                        
                        self.messageDetail.append(info)
                }
            }
        }
        self.tableView.reloadData()
      })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageDet = messageDetail[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? messageDetailCell {
            cell.configureCell(messageDetail: messageDet)
            return cell
        } else {
        return messageDetailCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipient = messageDetail[indexPath.row].recipient
        messageId = messageDetail[indexPath.row].messageRef.key
        performSegue(withIdentifier: "toMessages", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MessageVC {
            destinationViewController.recipient = recipient
            destinationViewController.messageId = messageId
        }
    }

    /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } */
}
