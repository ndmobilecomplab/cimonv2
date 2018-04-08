//
//  NotificationDetailsViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 4/6/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class NotificationDetailsViewController: UIViewController {

    var selectedNotification:AppNotification!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if selectedNotification.deleteOnView == 1{
            Syncer.sharedInstance.deleteNotification(appNotification: self.selectedNotification)
        }else{
            Syncer.sharedInstance.updateViewCount(appNotification: selectedNotification)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteNotification(_ sender: Any) {
        print("delete button clicked....")
        Syncer.sharedInstance.deleteNotification(appNotification: self.selectedNotification)
        self.navigationController?.popViewController(animated: true)
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
