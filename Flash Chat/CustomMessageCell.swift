//
//  CustomMessageCell.swift
//  Flash Chat
//
//  Created by Vaibhav Nandam on 7/12/18.
//  Copyright © 2018 Vaibhav Nandam. All rights reserved.
//

import UIKit

class CustomMessageCell: UITableViewCell {


    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var senderUsername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code goes here
        
        
        
    }


}
