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

extension SurveyResponse{
    func toJSON() -> Dictionary<String, AnyObject> {
        return [
            "studyId": self.studyId as AnyObject,
            "surveyId": self.surveyId as AnyObject,
            "taskId": self.taskId as AnyObject,
            "version": self.version as AnyObject,
            "submissionTime": self.submissionTime as AnyObject,
            "submissionTimeZone": self.submissionTimeZone as AnyObject,
            "answer": self.answer as AnyObject,
            "answerType": self.answerType as AnyObject
        ]
    }
    
}
