//
//  ExperienceTableViewCell.swift
//  SquadUpHR
//
//  Created by nicholaslee on 16/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ExperienceTableViewCell"
    static let cellNib = UINib(nibName: ExperienceTableViewCell.cellIdentifier, bundle: Bundle.main)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
