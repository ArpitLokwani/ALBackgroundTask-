//
//  ViewController.swift
//  ALBackgroundTask
//
//  Created by Arpit Lokwani on 9/2/17.
//  Copyright © 2017 Arpit Lokwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var starTaskButton: UIButton!
    @IBOutlet weak var stopTaskButton: UIButton!
    
    var timer = Timer()
    var backgroundTask = BackgroundTask()
    
    
    @IBAction func initiateBackgroundThread(_ sender: Any) {
        backgroundTask.startBackgroundTask()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        starTaskButton.alpha = 0.5
        starTaskButton.isUserInteractionEnabled = false
        
        stopTaskButton.alpha = 1
        stopTaskButton.isUserInteractionEnabled = true
    }
    
    @IBAction func stopBackgroundThread(_ sender: Any) {
        starTaskButton.alpha = 1
        starTaskButton.isUserInteractionEnabled = true
        stopTaskButton.alpha = 0.5
        stopTaskButton.isUserInteractionEnabled = false
        
        timer.invalidate()
        backgroundTask.stopBackgroundTask()
        label.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTaskButton.alpha = 0.5
        stopTaskButton.isUserInteractionEnabled = false
        
    }
    
    func timerAction() {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([ .hour, .minute, .second], from: date)
        let hour = components.hour
        let minutes = components.minute
        let seconds = components.second
        label.text = "\(hour ?? 0):\(minutes ?? 0) \(seconds ?? 0)"
        print("SomeCoolTaskRunning.....")
    }
}

