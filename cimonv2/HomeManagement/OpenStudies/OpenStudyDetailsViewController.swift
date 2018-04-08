//
//  OpenStudyDetailsViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/7/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class OpenStudyDetailsViewController: UITableViewController {

    var indexPathInList:IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UINib(nibName: "OpenStudyBannerViewCell", bundle: nil), forCellReuseIdentifier: "openstudybannercell")
        self.tableView.register(OpenStudyDescriptionViewCell.self, forCellReuseIdentifier: "openstudydescriptioncell")

        
        self.tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enroll", style: .plain, target: self, action: #selector(enrollToStudy))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func enrollToStudy(){
        let userInfo = [ "index" : indexPathInList ]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "deletestudyfromlist"), object: nil, userInfo: userInfo)
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Description"
        }else if section == 2{
            return "Instructions"
        }else if section == 3{
            return "Reviews"
        }else{
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 150
        }else{
            return UITableViewAutomaticDimension
        }
        
        //return 150
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "openstudybannercell", for: indexPath) as! OpenStudyBannerViewCell
            
            // Configure the cell...
            print("section \(indexPath.section), row:\(indexPath.row)")
            //cell.descriptionLabel.text = "hfjk fsdfh dsjfhsdj  jfhdj sfsf fhdjk fsdjf dsjfh . fdskf sdf /fdf hdsfd fjfsk fdjks dfjskdfjsdf f dsjjf f kjf.ahs cncjhasdhibjhfiouur9wern38f fhsiudhishk dm djduhaiuhd mn hdas djansjkdk."
            cell.nameLabel.text = "Test study related to parkinson"
            cell.orgLabel.text = "University of Notre Dame"
            cell.studyImage.image = UIImage(named: "task")
            cell.studyImage.contentMode = .scaleAspectFit
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "openstudydescriptioncell", for: indexPath) as! OpenStudyDescriptionViewCell
            
            // Configure the cell...
            print("section \(indexPath.section), row:\(indexPath.row)")
            cell.descriptionLabel.text = "hfjk fsdfh dsjfhsdj  jfhdj sfsf fhdjk fsdjf dsjfh . fdskf sdf /fdf hdsfd fjfsk fdjks dfjskdfjsdf f dsjjf f kjf.ahs cncjhasdhibjhfiouur9wern38f fhsiudhishk dm djduhaiuhd mn hdas djansjkdk."
            return cell

        }

    }

}
