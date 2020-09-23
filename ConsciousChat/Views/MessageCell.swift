//
//  MessageCell.swift
//  ConsciousChat
//
//  Created by Dan O on 9/13/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

  @IBOutlet weak var messageBubble: UIView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var rightImageView: UIImageView!
  @IBOutlet weak var leftImageView: UIImageView!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 10
    

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
