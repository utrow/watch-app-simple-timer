//
//  TimerDetailController.swift
//  MyWatchTimerWatch Extension
//
//  Created by buch on 2019/10/26.
//  Copyright © 2019 buch. All rights reserved.
//

import WatchKit

class TimerDetailController: WKInterfaceController {

    @IBOutlet weak var Timer: WKInterfaceTimer!
    @IBOutlet weak var StartButton: WKInterfaceButton!
    @IBOutlet weak var StopButton: WKInterfaceButton!
    @IBOutlet weak var ResetButton: WKInterfaceButton!
    
    var isRunning = false
    
    override func didAppear() {
        initializeTimer()
    }
    
    func initializeTimer() {
        updateButtons()
    }
    
    func updateButtons() {
        StartButton.setHidden(isRunning)
        StopButton.setHidden(!isRunning)
        
        ResetButton.setHidden(false)
    }
    
    @IBAction func onTapStartButton() {
        print("start")
        self.isRunning = true
        Timer.start()
        updateButtons()
    }
    
    @IBAction func onTapStopButton() {
        print("stop")
        self.isRunning = false
        Timer.stop()
        updateButtons()
    }
    
    @IBAction func onTapResetButton() {
        print("reset")
        self.isRunning = false
        Timer.setDate(Date.init())
        updateButtons()
    }
    
    
}
