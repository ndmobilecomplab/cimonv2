//
//  TaskListViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 3/3/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit
import Eureka

class TaskListViewController: FormViewController {
    var studyId:Int = 0
    var surveyId:Int = 0
    var taskList:[Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitForm))

        // Do any additional setup after loading the view.
        taskList = DummyData.getDummyTask(studyId: self.studyId, surveyId: self.surveyId)
        
        for i in 0..<taskList.count{
            let type = taskList[i].type
            let task = taskList[i]
            if type.lowercased() == "text"{
                form +++ Section("Q. \(task.text)"){ section in
                    section.tag = "\(task.taskId)"
                }
                <<< TextRow(){row in
                    row.placeholder = "Type your answer"
                }
            }else if type.lowercased() == "textarea"{
                form +++ Section("Q. \(task.text)"){ section in
                    section.tag = "\(task.taskId)"
                }
                <<< TextAreaRow(){row in
                    row.placeholder = "Type your answer"
                }
            }else if type.lowercased() == "date"{
                form +++ Section("Q. \(task.text)"){ section in
                    section.tag = "\(task.taskId)"
                }
                <<< DateRow(){row in
                    row.value = Date(timeIntervalSinceNow: 0)
                }

            }else if type.lowercased() == "selection"{
                form +++ SelectableSection<ImageCheckRow<String>>() { section in
                    section.header = HeaderFooterView(title: "Q. \(task.text)")
                    section.tag = "\(task.taskId)"
                }
                let availableOptions = task.possibleInput.split(separator: "|")
                for item in availableOptions {
                    let option = String(item)
                    form.last! <<< ImageCheckRow<String>(option){ lrow in
                        lrow.title = option
                        lrow.selectableValue = option
                        lrow.value = nil
                    }
                }

                
            }else if type.lowercased() == "choice"{
                form +++ SelectableSection<ImageMultipleCheckRow<String>>() { section in
                    section.header = HeaderFooterView(title: "Q. \(task.text)")
                    section.selectionType = SelectionType.multipleSelection
                    section.tag = "\(task.taskId)"
                }
                let availableOptions = task.possibleInput.split(separator: "|")
                for item in availableOptions {
                    let option = String(item)
                    form.last! <<< ImageMultipleCheckRow<String>(option){ lrow in
                        lrow.title = option
                        lrow.selectableValue = option
                        lrow.value = nil
                    }
                }
                
                
            }else if type.contains(s: "MT001"){
                print("task type: \(taskList[i].type)")
                form +++ Section("Tap to Start")
                    <<< MotorTaskPresenterRow() { row in
                        row.value = MotorTask(type: "", imagePath: "signature")
                        row.presentationMode = .show(controllerProvider: ControllerProvider.callback {
                            let storyBoard = UIStoryboard(name: "Task", bundle: nil)
                            let controller = storyBoard.instantiateViewController(withIdentifier: "signaturetaskvc") as! MotorTaskViewController
                            //controller.delegate = row
                            return controller
                            }, onDismiss: { vc in
                                _ = vc.navigationController?.popViewController(animated: true)
                        })
                    }

            } else if type.contains(s: "MT002"){
                print("task type: \(taskList[i].type)")
                form +++ Section("Tap to Start")
                    <<< MotorTaskPresenterRow() { row in
                        row.value = MotorTask(type: "", imagePath: "memory")
                        row.presentationMode = .show(controllerProvider: ControllerProvider.callback {
                            let storyBoard = UIStoryboard(name: "Task", bundle: nil)
                            let controller = storyBoard.instantiateViewController(withIdentifier: "signaturetaskvc") as! MotorTaskViewController
                            //controller.delegate = row
                            return controller
                            }, onDismiss: { vc in
                                _ = vc.navigationController?.popViewController(animated: true)
                        })
                }
                
            } else if type.contains(s: "MT003"){
                print("task type: \(taskList[i].type)")
                form +++ Section("Tap to Start")
                    <<< MotorTaskPresenterRow() { row in
                        row.value = MotorTask(type: "", imagePath: "balance")
                        row.presentationMode = .show(controllerProvider: ControllerProvider.callback {
                            let storyBoard = UIStoryboard(name: "Task", bundle: nil)
                            let controller = storyBoard.instantiateViewController(withIdentifier: "signaturetaskvc") as! MotorTaskViewController
                            //controller.delegate = row
                            return controller
                            }, onDismiss: { vc in
                                _ = vc.navigationController?.popViewController(animated: true)
                        })
                }
                
            }
        }
    }
    
    @objc func submitForm(){
        self.navigationController?.popViewController(animated: true)
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
