//
//  TopicItemCell.swift
//  cnode2
//
//  Created by shuironglin on 2019/6/20.
//  Copyright © 2019 shuironglin. All rights reserved.
//

import UIKit

class TopicItemCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UITextView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var topicTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
