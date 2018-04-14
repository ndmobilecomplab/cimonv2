//
//  TestCollectionViewCell.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/9/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    var rectView:UIView!
    var labelButton:UIButton!
    var delegate:LabelViewCellDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
    }
    /*
    override func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }*/
    
    func addViews(){
        //rectView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        
        //let image = UIImage(named: "button") as UIImage?
        labelButton = UIButton(type: UIButtonType.roundedRect) as UIButton
        labelButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //labelButton.setBackgroundImage(image, for: .normal)
        labelButton.addTarget(self, action: #selector(tapLabel), for: .touchUpInside)
        
        //rectView.addSubview(labelButton)
        self.addSubview(labelButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapLabel(){        
        delegate.labelTapped(self)
    }

}

protocol LabelViewCellDelegate: class {
    func labelTapped(_ sender:TestCollectionViewCell)
}

