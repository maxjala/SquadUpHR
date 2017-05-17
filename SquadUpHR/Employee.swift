//
//  Employee.swift
//  SquadUpHR
//
//  Created by nicholaslee on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import Foundation

class Employee{
    var firstName: String = ""
    var lastName: String = ""
    var jobTitle: String = ""
    var department: String = ""
    var companyID: Int = 0
    var accessLevel: Int = 0
    var email: String = ""
    var employeeID = "private_token"
    var fullName: String = ""
    
    init(aJobTitle: String, aDepartment: String, aCompanyID: Int, anAccessLevel: Int) {
    
       fullName = firstName + lastName
        
        jobTitle = aJobTitle
        department = aDepartment
        companyID = aCompanyID
        accessLevel = anAccessLevel
        
    }
    
    
    
}
