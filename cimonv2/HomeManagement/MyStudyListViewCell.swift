//
//  MyStudyListViewCell.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/9/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class MyStudyListViewCell: UITableViewCell {

    @IBOutlet weak var studyNameLabel: UILabel!
    @IBOutlet weak var orgNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        studyNameLabel.textColor = UIColor.black
        studyNameLabel.text = ""
        studyNameLabel.translatesAutoresizingMaskIntoConstraints = false

        orgNameLabel.textColor = UIColor(red: 0, green: 0.7804, blue: 0.902, alpha: 1.0) /* #00c7e6 */
        orgNameLabel.text = "University of Notre Dame"
        orgNameLabel.translatesAutoresizingMaskIntoConstraints = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
