//
//  FriendCell.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/12.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    static let identifier: String = "FriendCell"
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriend(image: String, name: String, message: String?){
    
        profileButton.setImage(UIImage(named: image), for: UIControl.State.normal)
        nameLabel.text = name
        messageLabel.text = message
    }

}
