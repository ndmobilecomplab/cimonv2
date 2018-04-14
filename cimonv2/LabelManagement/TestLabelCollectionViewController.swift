//
//  TestLabelCollectionViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/9/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit


class TestLabelCollectionViewController: UICollectionViewController, LabelViewCellDelegate {
    fileprivate let reuseIdentifier = "labelviewcell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    fileprivate var itemsPerRow: CGFloat = 3
    var collectionItemSelectDelegate:CollectionItemSelectDelegate!
    var labelTextList:[String] = [String]()//["ANGRY", "SAD", "HAPPY", "EXCITED", "ANNOYED", "ANXIOUS"]
    
    func initData(labels:[String]){
        labelTextList = labels
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        //self.collectionView?.backgroundColor = UIColor.red
        self.collectionView?.allowsMultipleSelection = true;
        self.collectionView?.allowsSelection = true; //this is set by default

        let backgroundImage = UIImage(named: "backgroundnologo")!
        let backgroundView = UIImageView(image: backgroundImage)
        self.collectionView?.backgroundView = backgroundView
        //self.collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)//UIImageView(image: UIImage(named: "backgroundlogo"))
        
        //NotificationCenter.default.addObserver(self, selector: #selector(handleTapAction(_:)), name: NSNotification.Name(rawValue: "tapnewlabelcheck"), object: nil)

    }
    
    @objc func handleTapAction(_ notification: NSNotification){
        /*guard let label = notification.userInfo?["label"] as? String else { return }
        if labelTextList.contains(label){
            let userInfo = [ "label" : label]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tapnewlabel"), object: nil, userInfo: userInfo)

        }
        */
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    func labelTapped(_ sender: TestCollectionViewCell) {
        //guard let label = sender.labelButton.titleLabel?.text as! String? else { return }
        let label = sender.labelButton.titleLabel?.text
        print("\(String(describing: sender.labelButton.titleLabel?.text))")

        collectionItemSelectDelegate.handleItemTapAction(label: label!)
    }

}

// MARK: - UICollectionViewDataSource
extension TestLabelCollectionViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return labelTextList.count
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! TestCollectionViewCell
        print(" \(indexPath), \(labelTextList[indexPath.row])")
        //cell.nameLabel.text = publicStudiesData[indexPath.row].name
        cell.labelButton.setTitle(labelTextList[indexPath.row], for: .normal)
        cell.labelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        // add a border
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10 // optional
        
        cell.delegate = self
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        if let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "openstudydetailsvc") as? OpenStudyDetailsViewController {
            viewController.indexPathInList = indexPath
            viewController.studyDetails = publicStudiesData[indexPath.row]
            //viewController.selectedNotification = object as! AppNotification
            navigationController?.pushViewController(viewController, animated: true)
            
        }*/
        print("item clicked \(labelTextList[indexPath.row])")
        let userInfo = [ "label" : labelTextList[indexPath.row]]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tabnewlabel"), object: nil, userInfo: userInfo)
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
                                                                             withReuseIdentifier: "labelheaderreuseview",
                                                                             for: indexPath) as! LabelHeaderReusableView
            //headerView.studyHeader.text = searches[(indexPath as NSIndexPath).section].searchTerm
            self.collectionItemSelectDelegate = headerView
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
}


extension TestLabelCollectionViewController : UICollectionViewDelegateFlowLayout {
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



protocol CollectionItemSelectDelegate: class {
    func handleItemTapAction(label:String)
}

