//
//  SkillCollectionViewCell.swift
//  SquadUpHR
//
//  Created by Max Jala on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    static let cellIdentifier = "SkillCollectionViewCell"
    static let cellNib = UINib(nibName: SkillCollectionViewCell.cellIdentifier, bundle: Bundle.main)

    
    var skillCategory: SkillCategory? {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateUI()
    {
        if let skillCategory = skillCategory {
            featuredImageView.image = skillCategory.featuredImage
            interestTitleLabel.text = skillCategory.title
            backgroundColorView.backgroundColor = skillCategory.color
        } else {
            featuredImageView.image = nil
            interestTitleLabel.text = nil
            backgroundColorView.backgroundColor = nil
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


