//
//  BrowseTutorVC.swift
//  SquadUpHR
//
//  Created by Max Jala on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit
import MessageUI

class BrowseTutorVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var connectLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(EmployeeTableViewCell.cellNib, forCellReuseIdentifier: EmployeeTableViewCell.cellIdentifier)
        }
    }
    
    @IBOutlet weak var accentView: UIView! {
        didSet {
            accentView.layer.shadowRadius = 10
            accentView.layer.shadowOpacity = 0.4
            accentView.layer.shadowOffset = CGSize(width: 5, height: 10)
            
            accentView.clipsToBounds = false
        }
    }
    
    
    var employees : [Employee] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mockEmployees()
    }
    
    func mockEmployees() {
        //let emp1 = Employee(anID: "123", aJobTitle: "iOS Developer", aDepartment: "IT", aFirstName: "Max", aLastName: "Jala", anEmail: "maxjala@gmail.com")
        //let emp2 = Employee(anID: "123", aJobTitle: "iOS Developer", aDepartment: "IT", aFirstName: "Max", aLastName: "Jala", anEmail: "maxjala@gmail.com")
        //let emp3 = Employee(anID: "123", aJobTitle: "iOS Developer", aDepartment: "IT", aFirstName: "Max", aLastName: "Jala", anEmail: "maxjala@gmail.com")
        
        let emp1 = ["private_token": "12313", "firstName": "Max", "lastName": "Jala", "jobTitle": "iOS Developer", "department": "IT", "email": "maxjala@gmail.com"]
        let emp2 = ["private_token": "12313", "firstName": "Max", "lastName": "Jala", "jobTitle": "iOS Developer", "department": "IT", "email": "maxjala@gmail.com"]
        let emp3 = ["private_token": "12313", "firstName": "Max", "lastName": "Jala", "jobTitle": "iOS Developer", "department": "IT", "email": "maxjala@gmail.com"]
        
        let mockArray : [[String:Any]] = [emp1,emp2,emp3]
        
        employees = JSONConverter.createObjects(mockArray) as! [Employee]
        
    }

    @IBAction func emailButtonTapped(_ sender: Any) {
        sendEmail()
    }

    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["maxjala@gmail.com"])
            mail.setMessageBody("<p>Hey Friend! I am requesting mentorship through SquadUp!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        
        controller.dismiss(animated: true, completion: nil)    }
    
}

extension BrowseTutorVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.cellIdentifier) as? EmployeeTableViewCell else {return UITableViewCell()}
        
        let employee = employees[indexPath.row]
        
        cell.nameLabel.text = employee.fullName
        cell.jobTitleLabel.text = employee.jobTitle
        
        return cell
    }
}

extension BrowseTutorVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
