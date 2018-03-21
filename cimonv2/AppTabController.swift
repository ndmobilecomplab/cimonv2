//
//  AppTabController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 3/19/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class AppTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectedIndex = 1
        
        self.synData()
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(_:)), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
    }

    @objc func applicationWillEnterForeground(_ notification: NSNotification) {
        print("app comes into foreground...")
    }
    
    func synData(){
        Syncer.sharedInstance.syncStudies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
