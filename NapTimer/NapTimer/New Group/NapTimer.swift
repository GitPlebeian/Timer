//
//  NapTimer.swift
//  NapTimer
//
//  Created by Jackson Tubbs on 8/6/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

protocol NapTimerDelegate: class {
    func timerSecondTicked()
    func timerStopped()
    func timerCompleted()
}

class NapTimer {
    
    // MARK: - Properties
    
    weak var delegate: NapTimerDelegate?
    
    private var timer: Timer?
    var timeLeft: TimeInterval?
    var isOn: Bool {
            return timeLeft == nil ? false : true
    }
    
    // MARK: - Public Methods
    
    func startTimer(_ time: TimeInterval) {
        if isOn {
            print("Timer is already running!")
        } else {
            timeLeft = time
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        timeLeft = nil
        timer?.invalidate()
        print("Stopped timer")
        // Let the view controller know what is good
        delegate?.timerStopped()
    }
    
    // MARK: - Private Methods
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else {return}
        if timeLeft > 0 {
            
            self.timeLeft = timeLeft - 1
            print(timeLeftAsString())
            
            delegate?.timerSecondTicked()
        } else {
            stopTimer()
            delegate?.timerCompleted()
        }
    }
    
    func timeLeftAsString() -> String {
        let timeRemaining = Int(timeLeft ?? 3 * 60)
        let minutesRemaining = timeRemaining / 60
        let secondRemaining = timeRemaining - (minutesRemaining * 60)
        
        return String(format: "%02d : %02d", arguments: [minutesRemaining, secondRemaining])
    }
}
