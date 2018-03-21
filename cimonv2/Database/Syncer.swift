//
//  Syncer.swift
//  cimonv2
//
//  Created by Afzal Hossain on 3/14/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreData

class Syncer:NSObject{
    
    static let sharedInstance = Syncer()
    var context: NSManagedObjectContext!
    
    override init() {
        super.init()
        context = (UIApplication.shared.delegate as! AppDelegate).managedBackgroundContext
    }

    func saveContext(){
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func syncStudies(){
        let email:String = Utils.getDataFromUserDefaults(key: "email") as! String
        let serviceUrl = Utils.getBaseUrl() + "study/list?email=\(email)&uuid=\(Utils.getDeviceIdentifier())"
        Alamofire.request(serviceUrl).validate().responseJSON { response in
            switch response.result {
            case .success:
                let json = JSON(response.result.value as Any)
                print("response after object : \(json)")
                
                var studyDict = Dictionary<Int32, Study>()
                for localStudy in self.getAllStudies(){
                    print("this is for dict \(self.printStudies(studies: [localStudy]))")
                    studyDict[localStudy.studyId] = localStudy
                }
                
                for item in json.arrayValue{
                    print("id : \(item["id"].intValue)")
                    let studyId = Int32(item["id"].intValue)
                    let name = item["name"].stringValue
                    let modificationTime = item["modificationTime"].stringValue
                    
                    
                    if let study = studyDict[studyId]{
                        if study.modificationTime == modificationTime{
                            //both are same, no need to update
                            print("both are same, no need to update")
                        }else{
                            //update required
                            print("update required")
                            study.modificationTime = modificationTime
                            self.saveContext()
                            
                            //TODO: start updating surveys
                            self.syncSurveysOfStudy(studyId: studyId, studyName: name)
                        }
                        studyDict.removeValue(forKey: studyId)
                        print("removed from dict")
                    }else{
                        //insert study
                        print("insert study")
                        let newStudy:Study = NSEntityDescription.insertNewObject(forEntityName: "Study", into: self.context) as! Study
                        newStudy.studyId = studyId
                        newStudy.name = name
                        newStudy.studyDescription = item["description"].stringValue
                        newStudy.modificationTime = modificationTime
                        newStudy.state = Int16(item["state"].intValue)
                        self.saveContext()
                        
                        self.syncSurveysOfStudy(studyId: studyId, studyName: name)
                    }
                }
                
                print("total study in before delete db \(self.getAllStudies().count)")
                for (key, value) in studyDict{
                    //delete study with key, a chain operation
                    self.context.delete(value)
                    self.saveContext()
                    studyDict.removeValue(forKey: key)
                    print("removed from second operation")
                    
                    self.syncSurveysOfStudy(studyId: key, studyName: value.name!)
                }
                
                print("total study in after db \(self.getAllStudies().count)")
                self.printStudies(studies: self.getAllStudies())
                
            case .failure(let error):
                print(error)
                // TODO: show error label - service not available
            }
        }

    }
    
    func syncSurveysOfStudy(studyId:Int32, studyName:String){
        let serviceUrl = Utils.getBaseUrl() + "study/\(studyId)/surveys/published"
        Alamofire.request(serviceUrl).validate().responseJSON { response in
            switch response.result {
            case .success:
                let json = JSON(response.result.value as Any)
                print("response after object : \(json)")
                
                
                var surveyDict = Dictionary<Int32, Survey>()
                for localSurvey in self.getAllSurveys(studyId: studyId){
                    //print("this is for dict \(self.printStudies(studies: [localStudy]))")
                    surveyDict[localSurvey.surveyId] = localSurvey
                }
                
                for item in json.arrayValue{
                    print("id : \(item["id"].intValue)")
                    let surveyId = Int32(item["id"].intValue)
                    let publishTime = item["publishTime"].stringValue
                    let publishedVersion = item["publishedVersion"].intValue
                    
                    let name = item["name"].stringValue
                    let startTime = item["startTime"].stringValue
                    let endTime = item["endTime"].stringValue
                    let scheduleCode = item["schedule"].stringValue
                    
                    if let survey = surveyDict[surveyId]{
                        if survey.publishTime == publishTime && survey.version == publishedVersion{
                            //both are same, no need to update
                            print("both are same, no need to update")
                        }else{
                            //update required
                            print("update required")
                            survey.studyName = studyName
                            survey.publishTime = publishTime
                            survey.version = Int16(publishedVersion)
                            survey.name = name
                            survey.startTime = startTime
                            survey.endTime = endTime
                            survey.scheduleCode = scheduleCode
                            self.saveContext()
                            
                            //TODO: start updating tasks
                            self.syncTask(studyId: studyId, surveyId: surveyId)
                        }
                        surveyDict.removeValue(forKey: surveyId)
                        print("removed from dict")
                    }else{
                        //insert survey
                        print("insert survey")
                        let newSurvey:Survey = NSEntityDescription.insertNewObject(forEntityName: "Survey", into: self.context) as! Survey
                        newSurvey.studyId = studyId
                        newSurvey.studyName = studyName
                        newSurvey.surveyId = surveyId
                        newSurvey.name = name
                        newSurvey.publishTime = publishTime
                        newSurvey.version = Int16(publishedVersion)
                        newSurvey.startTime = startTime
                        newSurvey.endTime = endTime
                        newSurvey.scheduleCode = scheduleCode
                        
                        self.saveContext()
                        
                        self.syncTask(studyId: studyId, surveyId: surveyId)
                    }
                }
                
                for (key, value) in surveyDict{
                    //delete study with key, a chain operation
                    self.context.delete(value)
                    self.saveContext()
                    surveyDict.removeValue(forKey: key)
                    print("removed from second operation")
                    
                    self.syncTask(studyId: studyId, surveyId: key)
                }
                
                print("total surveys in db after syncing")
                self.printSurveys(surveys: self.getAllSurveys(studyId: studyId))
                
            case .failure(let error):
                print(error)
                // TODO: show error label - service not available
            }
        }

    }
    
    func syncTask(studyId:Int32, surveyId:Int32){
        let serviceUrl = Utils.getBaseUrl() + "study/\(studyId)/survey/\(surveyId)/tasklist"
        print("url:\(serviceUrl)")
        Alamofire.request(serviceUrl).validate().responseJSON { response in
            switch response.result {
            case .success:
                let json = JSON(response.result.value as Any)
                print("response after object : \(json)")
                
                let localTaskList:[Task] = self.getAllTasks(studyId: studyId, surveyId: surveyId)
                for task in localTaskList{
                    self.context.delete(task)
                    self.saveContext()
                }
                
                for item in json.arrayValue{
                    let newTask:Task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: self.context) as! Task
                    
                    newTask.studyId = studyId
                    newTask.surveyId = surveyId
                    newTask.taskId = item["taskId"].int16!
                    newTask.text = item["taskText"].stringValue
                    newTask.type = item["type"].stringValue
                    newTask.possibleInput = item["possibleInput"].stringValue
                    newTask.orderId = item["orderId"].int16!
                    newTask.isActive = item["isActive"].int16!
                    newTask.isRequired = item["isRequired"].int16!
                    newTask.parentTaskId = item["parentTaskId"].int16!
                    newTask.hasChild = item["hasChild"].int16!
                    newTask.childTriggeringInput = item["childTriggeringInput"].stringValue
                    newTask.defaultInput = item["defaultInput"].stringValue
                    
                    self.saveContext()
                }
            case .failure(let error):
                print(error)
                // TODO: show error label - service not available
            }
        }

    }
    
    func getStudy(studyId:Int32)->Study!{

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        fetchRequest.predicate = NSPredicate(format: "studyId = %d", studyId)
        do{
            var studyData = try context.fetch(fetchRequest) as! [Study]
            if studyData.count == 0{
                return nil
            } else {
                return studyData[0]
            }
        } catch let error as NSError{
            print("error:\(error)")
            return nil
        }
    }
    
    func getAllStudies()->[Study]!{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        do{
            return try context.fetch(fetchRequest) as! [Study]
        } catch let error as NSError{
            print("error:\(error)")
            return nil
        }
    }
    
    
    func printStudies(studies:[Study]){
        for study in studies{
            print("studyId:\(study.studyId), name:\(String(describing: study.name!)), description:\(String(describing: study.studyDescription!)), state:\(study.state), modification time:\(String(describing: study.modificationTime!))")
        }
    }

    func printSurveys(surveys:[Survey]){
        for survey in surveys{
            print("studyId:\(survey.studyId), studyName:\(survey.studyName), surveyId:\(survey.surveyId),name:\(String(describing: survey.name!)), version:\(survey.version), start time\(String(describing: survey.startTime)), end time:\(String(describing: survey.endTime)), cycle start:\(String(describing: survey.cycleStartTime)), cycle end:\(survey.cycleEndTime), cycle identifier:\(String(describing: survey.cycleIdentifier)), publish time:\(survey.publishTime), notified:\(survey.notified), participated:\(survey.participated), total participation:\(survey.totalParticipation)")
        }
    }

    func getAllSurveys(studyId:Int32)->[Survey]!{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Survey")
        fetchRequest.predicate = NSPredicate(format: "studyId = %d", studyId)
        do{
            return try context.fetch(fetchRequest) as! [Survey]
        } catch let error as NSError{
            print("error:\(error)")
            return nil
        }

    }
    
    func getAllTasks(studyId:Int32, surveyId:Int32)->[Task]!{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        fetchRequest.predicate = NSPredicate(format: "studyId = %d and surveyId = %d", studyId, surveyId)
        do{
            return try context.fetch(fetchRequest) as! [Task]
        } catch let error as NSError{
            print("error:\(error)")
            return nil
        }

    }
    
    
    func uploadSurveyResponses(){
        DispatchQueue.global(qos: .background).async {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SurveyResponse")
            //let request = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                let responses:[SurveyResponse] = try self.context.fetch(fetchRequest) as! [SurveyResponse]
                print("\(responses[0].toJSON())")
            } catch {
                print("error while deleting...")
            }

        }
        

    }
}
