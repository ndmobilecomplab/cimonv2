//
//  CommonStruct.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/13/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: service structs
struct Response {
    var code:Int
    var message:String

    static func responseFromJSONData(jsonData:JSON)->Response{
        let code = jsonData["code"].intValue
        let message = jsonData["message"].stringValue
        
        return Response(code: code, message: message)
    }
    
}



// MARK: Task structs

struct Task{
    var id:Int
    var text:String
    var type:String
    var possibleInput:String
    var orderId:Int
    var isActive:Int
    var isRequired:Int
    var parentTaskId:Int
    var hasChild:Int
    var inputToTriggerChild:String
    var defaultInput:String
}

struct Survey {
    var studyId:String
    var surveyId:String
    var versionId:Int
    var taskList:[Task]
}
