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
        let task1 = Task(studyId: 1, surveyId: 1, taskId: 1, text: "Your name", type: "text", possibleInput: "", orderId: 1, isActive: 1, isRequired: 0, parentTaskId: 0, hasChild: 0, childTriggeringInput: "", defaultInput: "")
        //trace shapes
        let task2 = Task(studyId: 1, surveyId: 1, taskId: 2, text: "Your birthday", type: "date", possibleInput: "", orderId: 2, isActive: 1, isRequired: 0, parentTaskId: 0, hasChild: 0, childTriggeringInput: "", defaultInput: "")

        let task3 = Task(studyId: 1, surveyId: 2, taskId: 1, text: "Your spouse name", type: "text", possibleInput: "", orderId: 1, isActive: 1, isRequired: 0, parentTaskId: 0, hasChild: 0, childTriggeringInput: "", defaultInput: "")
        //trace shapes
        let task4 = Task(studyId: 1, surveyId: 2, taskId: 2, text: "Your spouse birthday", type: "date", possibleInput: "", orderId: 2, isActive: 1, isRequired: 0, parentTaskId: 0, hasChild: 0, childTriggeringInput: "", defaultInput: "")

        
        
        /*
        //trace shapes with speech
        let task3 = Task(id: 3, text: "", type: "MT003", possibleInput: "", orderId: 3, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //trace shapes with cognitive load
        let task4 = Task(id: 4, text: "", type: "MT004", possibleInput: "", orderId: 4, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //gross trace shapes
        let task5 = Task(id: 5, text: "", type: "MT005", possibleInput: "", orderId: 5, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //gross trace shapes with speech
        let task6 = Task(id: 6, text: "", type: "MT006", possibleInput: "", orderId: 6, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //gross trace shapes with cognitive load
        let task7 = Task(id: 7, text: "", type: "MT007", possibleInput: "", orderId: 7, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //memory game
        let task8 = Task(id: 8, text: "", type: "MT008", possibleInput: "", orderId: 8, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //falling ball
        let task9 = Task(id: 9, text: "", type: "MT009", possibleInput: "", orderId: 9, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //target
        let task10 = Task(id: 10, text: "", type: "MT010", possibleInput: "", orderId: 10, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //viospatial
        let task11 = Task(id: 11, text: "", type: "MT011", possibleInput: "", orderId: 11, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //color
        let task12 = Task(id: 12, text: "", type: "MT012", possibleInput: "", orderId: 12, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //picture
        let task13 = Task(id: 13, text: "", type: "MT013", possibleInput: "", orderId: 13, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //balance
        let task14 = Task(id: 14, text: "", type: "MT014", possibleInput: "", orderId: 14, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
        
        //connect the dots
        let task15 = Task(id: 15, text: "", type: "MT015", possibleInput: "", orderId: 15, isActive: 1, isRequired: 0, parentTaskId: -1, hasChild: 0, inputToTriggerChild: "", defaultInput: "")
 
        */
 
        //survey 1
        let survey1 = Survey(surveyId: 1, studyId: 1, name: "Your details", description: "Enter your information", startTime: "", startTimeZone: "", endTime: "", endTimeZone: "", scheduleCode: "")
        
        //Survey 2
        let survey2 = Survey(surveyId: 1, studyId: 1, name: "Your Spouse details", description: "Enter your spouse information", startTime: "", startTimeZone: "", endTime: "", endTimeZone: "", scheduleCode: "")
        
        //case 1: one survey, show survey 1
        return [survey1, survey2]
        
        //case 2: one survey, show survey 2
        //return [survey2]
        
        //case 3: two surveys, show both
        //return [survey1, survey2]
    }
    
}





