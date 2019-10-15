//
//  ClubsListCell.swift
//  clubs
//
//  Created by apcs2 on 11/13/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class ClubsListCell: UITableViewCell {

    @IBOutlet weak var clubImg: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubType: UILabel!
    @IBOutlet weak var clubDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
