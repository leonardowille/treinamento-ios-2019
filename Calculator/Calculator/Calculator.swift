//
//  Calculator.swift
//  Calculator
//
//  Created by user default on 28/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Calculator {
    
    var operatorClicked = false
    var firstValue: Double = 0
    var operatorActive: String?
    var display = "0"
    
    func clear() {
        firstValue = 0
        operatorClicked = false
        operatorActive = nil
        display = "0"
    }
    
    func operatorPressed(_ operatorValue: String) {
        operatorClicked = true
        calculate()
        operatorActive = operatorValue
        
        calculateSingleOperation()
        
        display = firstValue.forTrailingZero()
    }
    
    func calculate() {
        let currentValueDisplay = Double(display) ?? 0.0
        
        if operatorActive == "+" {
            firstValue = firstValue + currentValueDisplay
        } else if operatorActive == "-" {
            firstValue = firstValue - currentValueDisplay
        } else if operatorActive == "*" {
            firstValue = firstValue * currentValueDisplay
        } else if operatorActive == "/" {
            firstValue = firstValue / currentValueDisplay
        } else if operatorActive != "ˆ" && operatorActive != "√" {
            operatorActive = nil
            firstValue = currentValueDisplay
        }
    }
    
    func calculateSingleOperation() {
        if operatorActive == "ˆ" {
            firstValue = pow(firstValue, 2)
            operatorActive = nil
        } else if operatorActive == "√" {
            firstValue = sqrt(firstValue)
            operatorActive = nil
        }
    }
    
    func numberPressed(_ value: String) -> String {
        if operatorClicked || display == "0" {
            operatorClicked = false
            display = value
        } else {
            display += value
        }
        
        return display
    }
}
