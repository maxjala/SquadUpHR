//
//  ProfileViewController.swift
//  SquadUpHR
//
//  Created by nicholaslee on 16/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    let mockProfile = ["name":"nick",
                       "age":12,
                       "project": "project A"] as [String : Any]
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var skillsButton: UIButton!{
        didSet{
            skillsButton.addTarget(self, action: #selector(skillsView), for: .touchUpInside)
        }
    }
    @IBOutlet weak var experienceButton: UIButton!{
        didSet{
            experienceButton.addTarget(self, action: #selector(experienceView), for: .touchUpInside)
        }
    }
    @IBOutlet weak var projectsButton: UIButton!{
        didSet{
            projectsButton.addTarget(self, action: #selector(projectView), for: .touchUpInside)
        }
    }
    @IBOutlet weak var addSkillButton: UIButton!{
        didSet{
            addSkillButton.addTarget(self, action: #selector(addSkills), for: .touchUpInside)
        }
    }
    

    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.register(SkillsTableViewCell.cellNib, forCellReuseIdentifier: SkillsTableViewCell.cellIdentifier)
            tableView.register(ExperienceTableViewCell.cellNib, forCellReuseIdentifier: ExperienceTableViewCell.cellIdentifier)
            tableView.register(ProjectTableViewCell.cellNib, forCellReuseIdentifier: ProjectTableViewCell.cellIdentifier)
            
        }
    }
    
    var projects : [Project] = []
    var experiecens : [Experience] = []
    var selectedViews : [Any] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func skillsView(){
    
    }
    
    func experienceView(){
    }
    
    func projectView(){
        selectedViews = projects
        self.tableView.reloadData()
        
    }
    
    func addSkills(){
    }
    
    func convertToDict(projectInfo: [String : Any]) -> Project?{
        if let projectID = projectInfo["projectId"] as? Int,
        let userID = projectInfo["userId"] as? Int,
        let status = projectInfo["status"] as? Int,
        let projectTitle = projectInfo ["projectTitle"] as? String,
        let projectDesc = projectInfo["projectDesc"] as? String{
        
        let project = Project(anID: projectID, aUserID: userID, aStatus: status, aTitle: projectTitle, aDesc: projectDesc)
            
            //self.projects.append(project)
            return project
        }
        
        return nil
        
    }
    
    
}
extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? ProjectTableViewCell else {return UITableViewCell() }
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate{

}



/*
    TO DO:
 
    1. Projects Display.
    2. Experience Display.
    3. ability to add skills 
 
 */
