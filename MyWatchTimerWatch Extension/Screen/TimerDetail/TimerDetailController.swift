//
//  TimerDetailController.swift
//  MyWatchTimerWatch Extension
//
//  Created by buch on 2019/10/26.
//  Copyright © 2019 buch. All rights reserved.
//

import WatchKit
import Foundation

class TimerDetailController: WKInterfaceController {

    @IBOutlet weak var UITimer: WKInterfaceTimer!
    @IBOutlet weak var StartButton: WKInterfaceButton!
    @IBOutlet weak var StopButton: WKInterfaceButton!
    @IBOutlet weak var ResetButton: WKInterfaceButton!

    var isRunning = false
    var timerTimeMinutes: Int = 1

    var timerDate: Date?
    var pausedDate: Date?
    var timer: Timer?

    override func didAppear() {
        initializeTimer()
    }
    
    func initializeTimer() {
        resetTimer()
        updateButtons()
    }
    
    func updateButtons() {
        StartButton.setHidden(isRunning)
        StopButton.setHidden(!isRunning)


        ResetButton.setHidden(false)
    }

    func resetTimer() {
        if pausedDate != nil {
            pausedDate = nil
        }

        timerDate = Calendar.current.date(byAdding: .second, value: (self.timerTimeMinutes * 60 + 1), to: Date())!
        guard let timerDate = timerDate else { return }
        UITimer.setDate(timerDate)
    }

    func updateTimer() {
        if let timer = timer {
            timer.invalidate();
        }

        if let pausedDate = pausedDate, let timerDate = timerDate {
            let diffSeconds = Date().timeIntervalSince(pausedDate)
            let modifiedDate = Calendar.current.date(byAdding: .second, value: Int(diffSeconds), to: timerDate)!
            self.timerDate = modifiedDate

            timer = Timer.scheduledTimer(
                    timeInterval: modifiedDate.timeIntervalSinceNow,
                    target: self,
                    selector: #selector(timerTick),
                    userInfo: nil,
                    repeats: false)

            UITimer.setDate(modifiedDate)

        } else {
            resetTimer()

            guard let timerDate = timerDate else { return }
            timer = Timer.scheduledTimer(
                    timeInterval: timerDate.timeIntervalSinceNow,
                    target: self,
                    selector: #selector(timerTick),
                    userInfo: nil,
                    repeats: false)
        }
    }

    @IBAction func onTapStartButton() {
        print("start")
        self.isRunning = true

        updateTimer()
        UITimer.start()
        updateButtons()
    }
    
    @IBAction func onTapStopButton() {
        print("stop")
        self.isRunning = false

        pausedDate = Date()

        UITimer.stop()
        updateButtons()
    }
    
    @IBAction func onTapResetButton() {
        print("reset")
        self.isRunning = false

        UITimer.stop()
        resetTimer()
        updateButtons()
    }

    @objc func timerTick() {
        print("timerTick")
        self.isRunning = false

        UITimer.stop()
        resetTimer()
        updateButtons()
    }
    
}
