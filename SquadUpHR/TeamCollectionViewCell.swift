//
//  TeamCollectionViewCell.swift
//  SquadUpHR
//
//  Created by nicholaslee on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    var teamSelection: Employee? {
        didSet{
        
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
        
    }
    
    
    
    
    
}
