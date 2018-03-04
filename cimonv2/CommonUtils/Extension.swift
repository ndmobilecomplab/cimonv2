//
//  StringUtils.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/13/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation


extension String
{
    var length: Int {
        get {
            return self.count
        }
    }
    
    func contains(s: String) -> Bool{
        return (self.range(of: s) != nil) ? true : false
    }

    func replaceAll(target: String, withString: String) -> String{
        return self.replacingOccurrences(of: target, with: withString, options: .literal, range: nil)
    }
    
    func trim()->String{
        let trimmed =  self.trimmingCharacters(in: .whitespaces)
        return trimmed
    }
    
    
    
}
