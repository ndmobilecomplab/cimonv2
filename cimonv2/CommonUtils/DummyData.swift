//
//  DummyDataJohn.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/19/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation


class DummyData: NSObject {

    static func getDummySurveys()->[Survey]{
        
        //signature
        let task1 = Task(id: 1, text: "", type: "MT001", possibleInput: "", orderId: 1, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //trace shapes
        let task2 = Task(id: 2, text: "", type: "MT002", possibleInput: "", orderId: 2, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //trace shapes with speech
        let task3 = Task(id: 3, text: "", type: "MT003", possibleInput: "", orderId: 3, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //motor function
        let task4 = Task(id: 2, text: "", type: "MT005", possibleInput: "", orderId: 2, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //memory game
        let task5 = Task(id: 3, text: "", type: "MT008", possibleInput: "", orderId: 3, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        
        
        //survey 1
        let survey1 = Survey(studyId: "p001", surveyId: "s001", versionId: 1, taskList: [task1, task2, task3])
        
        //Survey 2
        let survey2 = Survey(studyId: "p001", surveyId: "s002", versionId: 1, taskList: [task1, task4, task5])
        
        
        //case 1: one survey, show survey 1
        //return [survey1]
        
        //case 2: one survey, show survey 2
        //return [survey2]
        
        //case 3: two surveys, show both
        return [survey1, survey2]
    }

}


