//
//  ActivityViewController.swift
//  cimonv2
//
//  Created by John Templeton on 3/4/18.
//  Copyright © 2018 Afzal Hossain. All rights reserved.
//

import Foundation

class ActivityViewController: UIViewController {
    
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
    
    @IBAction func sittingPressed(_ sender: Any) {
        startTimer(label: "Sitting")
    }
    
    @IBAction func standingPressed(_ sender: Any) {
        startTimer(label: "Standing")
    }
    
    @IBAction func walkingPresses(_ sender: Any) {
        startTimer(label: "Walking")
    }
    
    @IBAction func runningPresses(_ sender: Any) {
        startTimer(label: "Running")
    }
    
    @IBAction func layingdownPresses(_ sender: Any) {
        startTimer(label: "Lying Down")
    }
    
    @IBAction func otherPresses(_ sender: Any) {
        startTimer(label: "Other")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



