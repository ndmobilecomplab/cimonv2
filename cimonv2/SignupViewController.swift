//
//  ViewController.swift
//  cimonv2
//
//  Created by Afzal Hossain on 2/11/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailTextField.text = ""
        emailErrorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: action handlers
    @IBAction func signup(_ sender: UIButton) {
        let email:String = (emailTextField.text?.trim())!
        if isValidEmail(email){
            self.continueButton.isEnabled = false
            let serviceUrl = Utils.getBaseUrl() + "signup/register?email=\(email)&uuid=\(Utils.getDeviceIdentifier())"
            Alamofire.request(serviceUrl).validate().responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(response.result.value as Any)
                    let responseStruct = Response.responseFromJSONData(jsonData: json)
                    if responseStruct.code == 0{
                        self.emailErrorLabel.isHidden = true
                        self.emailErrorLabel.text = ""
                        //save user info to user defaults
                        Utils.saveDataToUserDefaults(data: email, key: "email")
                        Utils.saveDataToUserDefaults(data: false, key: "signedup")
                        self.performSegue(withIdentifier: "TokenVerificationSegue", sender: nil)
                    } else{
                        self.emailErrorLabel.isHidden = false
                        self.emailErrorLabel.text = "Please Try Later"
                    }
                case .failure(let error):
                    print(error)
                    self.emailErrorLabel.isHidden = false
                    self.emailErrorLabel.text = "Please Try Later"
                }
                self.continueButton.isEnabled = true
            }

        } else{
            //isValid = false
            emailErrorLabel.isHidden = false
            emailErrorLabel.text = "Invalid Email"
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

