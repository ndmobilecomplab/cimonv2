//
//  OpenStudyViewCell.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/5/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class OpenStudyViewCell: UICollectionViewCell {
    
    var organizationLabel:OpenStudyOrganizationLabel!
    var nameLabel:OpenStudyNameLabel!
    var staticJoinLabel:OpenStudyJoinLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    
    func addViews(){
        
        organizationLabel = OpenStudyOrganizationLabel()
        organizationLabel.font = UIFont.systemFont(ofSize: 14)
        
        organizationLabel.textColor = UIColor(red: 0, green: 0.7804, blue: 0.902, alpha: 1.0) /* #00c7e6 */
        organizationLabel.text = "University of Notre Dame"
        organizationLabel.textAlignment = .center
        organizationLabel.translatesAutoresizingMaskIntoConstraints = false
        organizationLabel.numberOfLines = 0
        organizationLabel.layer.addBorder(edge: .bottom, color: UIColor.red, thickness: 1)
        //organizationLabel.backgroundColor = UIColor(hue: 0.1472, saturation: 0.1, brightness: 0.98, alpha: 1.0)
        
        //let lineView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 100))
        //lineView.layer.borderWidth = 5
        //lineView.layer.borderColor = UIColor.red.cgColor
        
        nameLabel = OpenStudyNameLabel()
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor.black
        nameLabel.text = ""
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        
        staticJoinLabel = OpenStudyJoinLabel()
        staticJoinLabel.font = UIFont.systemFont(ofSize: 14)
        staticJoinLabel.textColor = UIColor(red: 0, green: 0.9137, blue: 0.5569, alpha: 1.0) /* #00e98e */
        staticJoinLabel.text = "Join"
        staticJoinLabel.textAlignment = .center
        staticJoinLabel.translatesAutoresizingMaskIntoConstraints = false
        //staticJoinLabel.backgroundColor = UIColor.gray
        
        organizationLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 3)

        //staticJoinLabel.layer.borderColor = UIColor.gray.cgColor
        //staticJoinLabel.layer.borderWidth = 1
        
        let verticalStackView = UIStackView(arrangedSubviews: [organizationLabel, nameLabel, staticJoinLabel])
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 2
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(verticalStackView)
        
        let viewsDictionary = ["stackView":verticalStackView]
        let stackView_H = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[stackView]-5-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-2-[stackView]-2-|", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        self.addConstraints(stackView_V)
        self.addConstraints(stackView_H)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OpenStudyOrganizationLabel: UILabel {
    var height = 30
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 0, height: height)
    }
}

class OpenStudyNameLabel: UILabel {
    var height = 50
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 0, height: height)
    }
}

class OpenStudyJoinLabel: UILabel {
    var height = 20
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 0, height: height)
    }
}
