//
//  ViewController.swift
//  NapTimer
//
//  Created by Jackson Tubbs on 8/6/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    // MARK: - Properties
    
    var napTimer = NapTimer()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        napTimer.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func timerButtonTapped(_ sender: Any) {
        if napTimer.isOn {
            napTimer.stopTimer()
        } else {
            napTimer.startTimer(5)
        }
    }
    
    func updateLabelAndButton() {
        timerLabel.text = napTimer.timeLeftAsString()
        var buttonTitle = ""
        var buttonColor: UIColor = .white
        
        if napTimer.isOn {
            buttonTitle = "Stop"
            buttonColor = .red
        } else {
            buttonTitle = "Start"
            buttonColor = .green
        }
        
        timerButton.setTitle(buttonTitle, for: .normal)
        timerButton.setTitleColor(buttonColor, for: .normal)
    }
}

extension ViewController: NapTimerDelegate {
    func timerSecondTicked() {
        updateLabelAndButton()
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerCompleted() {
        // Present alert
    }
    
    
}

