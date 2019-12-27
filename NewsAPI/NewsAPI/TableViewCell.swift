//
//  TableViewCell.swift
//  NewsAPI
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
