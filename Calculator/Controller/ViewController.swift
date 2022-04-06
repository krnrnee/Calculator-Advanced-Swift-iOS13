//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var num1: Double = 0.0
    private var num2: Double = 0.0
    
    private var calculatorLogic = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let doubleValue = Double(self.displayLabel.text!) else {
                fatalError("Error converting display label text to double")
            }
            return doubleValue
        }
        set {
            self.displayLabel.text = String(newValue)
        }
    }
     
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        //displayLabel.text = "0"
        isFinishedTypingNumber = true
        calculatorLogic.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            guard let result = calculatorLogic.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numValue
                
            }
        }
    }
}

