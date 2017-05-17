//
//  ProjectViewController.swift
//  SquadUpHR
//
//  Created by nicholaslee on 17/05/2017.
//  Copyright © 2017 Max Jala. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    var mockEmployee = ["name" : "nick",
                        "title": "programmer"]
    var mockEmployee2 = ["name" : "max",
                         "title" : "Boss"]
    var mockEmployee3 = ["name" : "mahmoud",
                         "title" : "bomber"]
    
    var teamSelection : [[String:String]] = []
    let cellScaling: CGFloat = 0.6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamSelection.append(mockEmployee)
        teamSelection.append(mockEmployee2)
        teamSelection.append(mockEmployee3)
        
        customDesign()
        // Do any additional setup after loading the view.
    }


    func customDesign(){
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
}

extension ProjectViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamSelection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
        
        let employee = teamSelection[indexPath.row]
        //guard let name = employee["name"] as? String else {return}
        
        cell.nameLabel.text = employee["name"]
        cell.roleLabel.text = employee["title"]
        
        return cell
        
    }
}
extension ProjectViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let specificEmployee = teamSelection[indexPath.item]
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "") else {return}
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
