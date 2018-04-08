//
//  OpenStudiesViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/4/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit


class OpenStudiesViewController: UICollectionViewController {
    fileprivate let reuseIdentifier = "openstudycell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 30.0, bottom: 50.0, right: 30.0)
    fileprivate let itemsPerRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(OpenStudyViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: - UICollectionViewDataSource
extension OpenStudiesViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! OpenStudyViewCell
        //2
        //let flickrPhoto = photoForIndexPath(indexPath: indexPath)
        //cell.backgroundColor = UIColor.white
        //3
        //cell.imageView.image = flickrPhoto.thumbnail
        //cell.studyThumbnail?.image = flickrPhoto.thumbnail
        //cell.studyName?.text = flickrPhoto.photoID
        //print("photo id:\(flickrPhoto.photoID)")
        //cell.
        
        // add a border
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8 // optional
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "openstudydetailsvc") as? OpenStudyDetailsViewController {
            
            //viewController.selectedNotification = object as! AppNotification
            navigationController?.pushViewController(viewController, animated: true)
        }

    }
    
    /*
    override func collectionView(_ collectionView: UICollectionView,
                                 moveItemAt sourceIndexPath: IndexPath,
                                 to destinationIndexPath: IndexPath) {
        
        var sourceResults = searches[(sourceIndexPath as NSIndexPath).section].searchResults
        let flickrPhoto = sourceResults.remove(at: (sourceIndexPath as NSIndexPath).row)
        
        var destinationResults = searches[(destinationIndexPath as NSIndexPath).section].searchResults
        destinationResults.insert(flickrPhoto, at: (destinationIndexPath as NSIndexPath).row)
    }*/
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "openstudyheader",
                                                                             for: indexPath) as! StudyHeaderReusableView
            //headerView.studyHeader.text = searches[(indexPath as NSIndexPath).section].searchTerm
            
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
}


extension OpenStudiesViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            print("program should come here....")
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
