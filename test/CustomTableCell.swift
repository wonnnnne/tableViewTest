//
//  CustomTableCell.swift
//  test
//
//  Created by Taewon Lee on 11/28/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView! {
        didSet{
//            imgView.layer.cornerRadius = 40
//            imgView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
