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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.cellIdentifier) as? EmployeeTableViewCell else {return UITableViewCell()}
        
        return cell
    }
}

extension BrowseTutorVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
