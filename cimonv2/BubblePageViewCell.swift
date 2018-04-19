//
//  PageViewCell.swift
//  faspagertest
//
//  Created by Afzal Hossain on 4/4/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit
import FSPagerView

class BubblePageViewCell: UITableViewCell {
    fileprivate let imageNames = ["overview_1","overview_2", "overview_3", "overview_4", "overview_5", "overview_6"]
    fileprivate var numberOfItems = 6
    var faqPageView:FSPagerView!
    var pageControl:FSPageControl!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("this is me: \(self.frame.width), \(self.frame.height)")
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        //self.preferredMaxLayoutWidth = self.frame.size.width;
        print("in layout subview: \(self.frame.width), \(self.frame.height)")
        pageControl = FSPageControl(frame: CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.width, height: 20))
        self.pageControl.numberOfPages = self.imageNames.count
        self.pageControl.backgroundColor = UIColor.clear
        self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        pageControl.setStrokeColor(.gray, for: .normal)
        pageControl.setStrokeColor(.black, for: .selected)
        self.addSubview(pageControl)
        
        faqPageView = FSPagerView(frame: CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y+20, width: self.bounds.width, height: self.bounds.height-20))
        //faqPageView.itemSize = CGSize(width: self.faqPageView.bounds.width * 0.9, height: self.faqPageView.bounds.height * 0.9)
        faqPageView.isInfinite = true
        faqPageView.delegate = self
        faqPageView.dataSource = self
        faqPageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "fspagecell")
        
        self.addSubview(faqPageView)
        
        

    }
    
}

class InfoPageView: FSPagerView {
    var height = 150
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 0, height: height)
    }
}


extension BubblePageViewCell:FSPagerViewDataSource{
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        print("fspagerview number of items")
        return self.numberOfItems
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        print("fspagerview cellforitemat \(index)")
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "fspagecell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleToFill
        cell.imageView?.clipsToBounds = true
        //cell.textLabel?.text = index.description+index.description
        return cell
    }
}


extension BubblePageViewCell:FSPagerViewDelegate{
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.pageControl.currentPage = index
        print("fs page delegate did select item:\(index)")
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
        print("fs page did scroll \(pagerView.currentIndex)")
    }
    
}
