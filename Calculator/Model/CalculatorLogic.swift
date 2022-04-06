//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Karen Turner on 4/5/22.
//  Copyright © 2022 Brain Dance Designs LLC. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            print(number!, symbol)
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: symbol)
                return n
            }
        } else {
            return nil
        }
        
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            switch operation {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default: fatalError("Invalid symbol passed to PerformTwoNumCalculation")
            }
        }
        return nil
    }
    
}
