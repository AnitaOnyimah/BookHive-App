//
//  searchCell.swift
//  BeeBookHive
//
//  Created by Anita Onyimah on 9/26/18.
//  Copyright © 2018 BeeBookHive. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class searchCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    var searchDetail: Search!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(searchDetail: Search) {
        self.searchDetail = searchDetail
        nameLbl.text = searchDetail.username
        /* let ref = Storage.storage().reference(forURL: searchDetail.userImg)
        ref.data(withMaxSize: 1000000, completion: { (data, error) in
            if error != nil {
                print("we couldn't upload the img")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.userImage.image = img
                    }
                }
            }
        }) */
    }
}
