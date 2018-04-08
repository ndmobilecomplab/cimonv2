//
//  Utils.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/13/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation
import UIKit

class Utils: NSObject {
    
    // Mark: Dictionary functions
    
    /**
     A static function to save data to user default dictionary. This dictionary should be used in limited manner. Values that are related to user.
     
     Parameters: data (any type), string key
     */
    static func saveDataToUserDefaults(data:Any, key:String){
        UserDefaults.standard.set(data, forKey: key)
    }
    
    /**
     A static method to retrieve data from user defaults dictionary. Data was saved in Any type, so it is caller's responsibility to cast properly.
     Parameters: string key
     */
    static func getDataFromUserDefaults(key:String)->Any?{
        return UserDefaults.standard.object(forKey: key)
    }

    /**
     */
    static func removeDataFromUserDefault(key:String){
        UserDefaults.standard.removeObject(forKey:key)
    }
    
    //Mark: Date, Time
    static func stringFromDate(date:Date!)->String{
        if let inputDate = date{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateFormatter.string(from: inputDate)
        }
        return ""
    }
    
    // Mark: Web services
    /**
    */
    static func getBaseUrl()->String{
        return "http://129.74.247.110/cimoninterface/"
    }
    
    // Mark: device
    static func getDeviceIdentifier()->String{
        let uuid:String = (UIDevice.current.identifierForVendor?.uuidString)!
        return uuid
    }
    
    static func getAppDisplayName()->String{
        
        if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String{
            return displayName
        }
        return "System"
    }
    
    static func generateSystemNotification(message:String){
        let time = Date().timeIntervalSince1970
        let notifStruct:AppNotificationStruct = AppNotificationStruct(notificationId: Int64(time), originatedSource: getAppDisplayName(), originatedTime: String(time), title: getAppDisplayName(), message: message, loadingTime: String(time), loadingTimeZone: String(time), deleteOnView: 1, expiry: 12 * 60 * 60, viewCount: 0)
        Syncer.sharedInstance.insertNotification(notifStruct: notifStruct)
    }
    
}



