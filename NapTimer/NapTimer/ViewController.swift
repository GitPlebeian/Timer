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
    
    func presentAlear() {
        // Create alert controller
        let alertController = UIAlertController(title: "Times up", message: "Do you want to keep sleeping", preferredStyle: .alert)
        
        // Add textfield and actions
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "Ho many mor seconds"
            
        }
        // Present alert controller
        
        let dismissAction = UIAlertAction(title: "I'm Awake", style: .destructive, handler: nil)
        let snoozeAction = UIAlertAction(title: "Snooze", style: .default, handler: {(_) in
            if let textField = alertController.textFields?.first,
            
            let inputText = textField.text,
                let textAsDouble = Double(inputText) {
                self.napTimer.startTimer(textAsDouble)
            }
        })
        alertController.addAction(dismissAction)
        alertController.addAction(snoozeAction)
        
        present(alertController, animated: true)
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
        presentAlear()
    }
    
    
}

