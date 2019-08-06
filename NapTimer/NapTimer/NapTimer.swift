//
//  NapTimer.swift
//  NapTimer
//
//  Created by Jackson Tubbs on 8/6/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class NapTimer {
    
    // MARK: - Properties
    
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
            timer = Timer(timeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        timeLeft = nil
        timer?.invalidate()
        print("Stopped timer")
        // Let the view controller know what is good
    }
    
    // MARK: - Private Methods
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else {return}
        if timeLeft > 0 {
            
            self.timeLeft = timeLeft - 1
            print(self.timeLeft as Any)
            
        } else {
            
            stopTimer()
        }
    }
}
