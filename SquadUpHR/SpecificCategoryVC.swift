//
//  SpecificCategoryVC.swift
//  SquadUpHR
//
//  Created by Max Jala on 16/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class SpecificCategoryVC: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var category : SkillCategory?
    var skills: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        categoryLabel.text = category?.title
        
        //Mock Skills
        skills = ["Adobe Photoshop", "Adobe Illustrator", "Web Design", "Painting", "Public Speaking", "Excel Spreadsheets", "Balance Sheets", "Web Development", "iOS Development", "Adobe Photoshop", "Adobe Illustrator", "Web Design", "Painting", "Public Speaking", "Excel Spreadsheets", "Balance Sheets", "Web Development", "iOS Development"]
    }
    
}

extension SpecificCategoryVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell") as? SkillTableViewCell else {return UITableViewCell()}
        cell.skillLabel.text = skills[indexPath.row]
        cell.skillLabel.textColor = category?.color
        
        return cell
        
    }
}

extension SpecificCategoryVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}




