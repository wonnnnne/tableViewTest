//
//  TableViewCell.swift
//  Networking
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var useLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    

}
