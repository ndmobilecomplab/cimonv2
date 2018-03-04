//
//  ActiveSurveyTableViewCell.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/27/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class ActiveSurveyTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let descLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont (name: "Baskerville-Italic", size: 30)
        descLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size:17)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(descLabel)
        let viewsDict = [
            "surveyname" : nameLabel,
            "surveydesc" : descLabel,
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[surveyname]-[surveydesc]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[surveyname]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[surveydesc]-|", options: [], metrics: nil, views: viewsDict))

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


