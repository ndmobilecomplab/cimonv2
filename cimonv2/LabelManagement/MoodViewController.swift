//
//  ViewController.swift
//  LabelingApp
//
//  Created by Afzal Hossain on 3/2/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import UIKit

class MoodViewController: UIViewController {
    
    var isShimmering:Bool = false
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var shimmerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var stopWatch:MZTimerLabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("shimer text \(shimmerLabel.text)")
        stopWatch = MZTimerLabel.init(label: timerLabel)
        //startTimer()
        shimmerLabel.text = "Tap to Start"
        timerLabel.isHidden = true
        stopButton.isHidden = true
        
    }
    
    func startTimer(label:String){
        timerLabel.isHidden = false
        stopButton.isHidden = false
        stopWatch?.reset()
        stopWatch?.start()
        isShimmering = true
        shimmerLabel.text = label
        shimmerLabel.startShimmering()
    }
    
    @IBAction func stopLabelling(_ sender: Any) {
        isShimmering = false
        shimmerLabel.stopShimmering()
        shimmerLabel.text = "Tap to Start"
        stopWatch?.reset()
        timerLabel.isHidden = true
        stopButton.isHidden = true
    }
    
    @IBAction func angryPressed(_ sender: Any) {
        startTimer(label: "Angry")
    }
    
    @IBAction func sadPressed(_ sender: Any) {
        startTimer(label: "Sad")
    }
    
    @IBAction func happyPresses(_ sender: Any) {
        startTimer(label: "Happy")
    }
    
    @IBAction func excitedPresses(_ sender: Any) {
        startTimer(label: "Excited")
    }
    
    @IBAction func annoyedPresses(_ sender: Any) {
        startTimer(label: "Annoyed")
    }
    
    @IBAction func anxiousPresses(_ sender: Any) {
        startTimer(label: "Anxious")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


