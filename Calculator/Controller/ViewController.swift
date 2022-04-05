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
    private var decimalAlreadyPressed: Bool = false
    private var num1: Double = 0.0
    private var num2: Double = 0.0
    private var lastOperation: String = ""
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        //displayLabel.text = "0"
        isFinishedTypingNumber = true
        guard let doubleValue = Double(self.displayLabel.text!) else {
            fatalError("Error converting display label text to double")
        }
        
        switch sender.currentTitle {
        case "AC":
            self.displayLabel.text = "0"
            num1 = 0.0
            num2 = 0.0
        case "+/-":
            num1 = doubleValue
            num1 = num1 * -1.0
            self.displayLabel.text = String(num1)
        case "%":
            num1 = doubleValue
            num1 = num1 / 100.0
            self.displayLabel.text = String(num1)
        case "+":
            num1 += doubleValue
            self.displayLabel.text = String(num1)
        case "-":
            num1 -= doubleValue
            self.displayLabel.text = String(num1)
        default:
            self.displayLabel.text = "0"
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
                   guard let currentDisplayValue = Double(displayLabel.text!) else {
                       fatalError("Error converting display label text to double")
                   }
                   
                   let isInt = floor(currentDisplayValue) == currentDisplayValue
 
                   if !isInt {
                       return
                   }
               }
                displayLabel.text! += numValue
            }
        }
        
    }
    
}

