//
//  CommonStruct.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/13/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Response {
    var code:Int
    var message:String

    static func responseFromJSONData(jsonData:JSON)->Response{
        let code = jsonData["code"].intValue
        let message = jsonData["message"].stringValue
        
        return Response(code: code, message: message)
    }
}
