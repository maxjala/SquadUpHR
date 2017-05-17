//
//  FetchJSON.swift
//  SquadUpHR
//
//  Created by Max Jala on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import Foundation

class FetchJSON {
    
    func fetchJSONResponse(_ url: String) -> [[String: Any]]? {
        //call the json to fetch all Projects
        guard let validToken = UserDefaults.standard.string(forKey: "AUTH_TOKEN") else {return nil}
        
        let url = URL(string: "")
        //var createdArray : [Any] = []
        
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
    
    func createProjects(jsonResponse: [[String : Any]]) -> [Project] {
        
        var projects : [Project] = []
        
        for each in jsonResponse {
            if let projectID = each["projectId"] as? Int,
                let userID = each["userId"] as? Int,
                let status = each["status"] as? Int,
                let projectTitle = each ["projectTitle"] as? String,
                let projectDesc = each["projectDesc"] as? String{
                
                let project = Project(anID: projectID, aUserID: userID, aStatus: status, aTitle: projectTitle, aDesc: projectDesc)
                
                projects.append(project)
                //return projects
            }
        }
        
        return projects
        
    }

}
