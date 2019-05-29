//
//  ViewController.swift
//  Calculator
//
//  Created by user default on 26/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var calculator = Calculator()
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet var numbersArray: [UIButton]!
    @IBOutlet var operatorsArray: [UIButton]!
    
    @IBAction func clearCalculator(_ sender: Any) {
        calculator.clear()
        display.text = calculator.display
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let index = operatorsArray.index(of: sender), let operatorCalc = operatorsArray[index].currentTitle {
            calculator.operatorPressed(operatorCalc)
            display.text = calculator.display
        }
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if let buttonNumber = numbersArray.index(of: sender), let numPressed = numbersArray[buttonNumber].currentTitle {
            display.text = calculator.numberPressed(numPressed)
        }
    }
}
