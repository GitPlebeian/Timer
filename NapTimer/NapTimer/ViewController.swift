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
        napTimer.startTimer(30)
    }
    
    // MARK: - Actions
    
    @IBAction func timerButtonTapped(_ sender: Any) {
        
    }
    


}

