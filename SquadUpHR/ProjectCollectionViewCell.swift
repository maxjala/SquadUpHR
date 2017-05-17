//
//  ProjectCollectionViewCell.swift
//  SquadUpHR
//
//  Created by Max Jala on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roleLabel: UILabel!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    static let cellIdentifier = "ProjectCollectionViewCell"
    static let cellNib = UINib(nibName: ProjectCollectionViewCell.cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
