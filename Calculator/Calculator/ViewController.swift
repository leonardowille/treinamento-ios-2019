//
//  ViewController.swift
//  Calculator
//
//  Created by user default on 26/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var operatorClicked = false
    var firstValue: Double = 0
    var operatorActive: String?
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet var numbersArray: [UIButton]!
    @IBOutlet var operatorsArray: [UIButton]!
    
    @IBAction func clearCalculator(_ sender: Any) {
        firstValue = 0
        operatorClicked = false
        operatorActive = nil
        display.text = "0"
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let index = operatorsArray.index(of: sender), let operatorCalc = operatorsArray[index].currentTitle {
            operatorClicked = true
            calculateFirstValue()
            display.text = firstValue.forTrailingZero()
            operatorActive = operatorCalc
        }
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if let buttonNumber = numbersArray.index(of: sender), let numPressed = numbersArray[buttonNumber].currentTitle {
            if operatorClicked || display.text == "0" {
                operatorClicked = false
                display.text = numPressed
            } else {
                display.text? += numPressed
            }
        }
    }

    func calculateFirstValue() {
        let currentValueDisplay: Double! = Double(display.text ?? "0")

        switch operatorActive {
        case "+":
            firstValue = firstValue + currentValueDisplay
        case "-":
            firstValue = firstValue - currentValueDisplay
        case "*":
            firstValue = firstValue * currentValueDisplay
        case "/":
            firstValue = firstValue / currentValueDisplay
        case "ˆ":
            firstValue = pow(firstValue, currentValueDisplay)
        case "√":
            firstValue = sqrt(currentValueDisplay)
        default:
            operatorActive = nil
            firstValue = currentValueDisplay
        }
    }
}
