//
//  ProfileViewController.swift
//  SquadUpHR
//
//  Created by nicholaslee on 16/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

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
        //fetchProjects()
        //fetchJSONDetails("", convertToDict(projectInfo: ))
        let JSONResponse = fetchJSONResponse("")
        
        
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
    
    func fetchJSONResponse(_ url: String) -> [[String: Any]]? {
        //call the json to fetch all Projects
        guard let validProjectToken = UserDefaults.standard.string(forKey: "AUTH_TOKEN") else {return nil}
        
        let url = URL(string: "")
        var createdArray : [Any] = []
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { (data,response,error) in
            
            if let validError = error {
                print(validError.localizedDescription)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        
                        guard let validJSON = jsonResponse as? [[String : Any]] else {return}
                        //MARK TO CHECK
//                        for each in validJSON {
//                            let newItem = objectConstructor
//                                createdArray.append(newItem)
//                        }
                        
                        
                        DispatchQueue.main.async {
                            return validJSON
                            //self.tableView.reloadData()
                        }
                    }catch let jsonError as NSError {
                    
                    }
                }
            }
        
    }
        dataTask.resume()
        return nil
    }
    
//    func createObjectsFromJSON(_ response: [[String:Any]]) -> [Any]? {
//        for each in response {
//            let newItem =
//        }
//    }
//    
    
    
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
