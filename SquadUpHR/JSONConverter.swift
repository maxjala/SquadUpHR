//
//  FetchJSON.swift
//  SquadUpHR
//
//  Created by Max Jala on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import Foundation

class JSONConverter {
    
    static func fetchJSONResponse(_ url: String) -> [[String: Any]]? {
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
    
    static func createObjects(_ jsonResponse: [[String : Any]]) -> [Any] {
        
        var returnedArray : [Any] = []
        
        for each in jsonResponse {
            
            //Create Projects
            if let projectID = each["projectId"] as? Int,
                let userID = each["userId"] as? Int,
                let status = each["status"] as? Int,
                let projectTitle = each ["projectTitle"] as? String,
                let projectDesc = each["projectDesc"] as? String{
                
                let project = Project(anID: projectID, aUserID: userID, aStatus: status, aTitle: projectTitle, aDesc: projectDesc)
                
                //projects.append(project)
                returnedArray.append(project)
                //return projects
            }
            
            //Create Employees
            if let employeeID = each["private_token"] as? String,
                let firstName = each["firstName"] as? String,
                let lastName = each["lastName"] as? String,
                let jobTitle = each ["jobTitle"] as? String,
                let department = each["department"] as? String,
                let email = each["email"] as? String {
                
                let employee = Employee(anID: employeeID, aJobTitle: jobTitle, aDepartment: department, aFirstName: firstName, aLastName: lastName, anEmail: email)
                //projects.append(project)
                returnedArray.append(employee)
                //return projects
            }
            
            
        }
        
        return returnedArray
        
    }
    

}
