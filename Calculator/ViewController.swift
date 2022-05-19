//
//  ViewController.swift
//  Calculator
//
//  Created by Phan Khai on 18/05/2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var firstEle = Float(0)
    var secondEle: Float!
    var op: String!
    var isFraction = false
    var countFraction = 0
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    func display(_ num: Float) {
        if num == Float(Int(num)) {
            displayLabel.text = String(Int(num))
        }
        else {
            displayLabel.text = String(num)
        }
    }
    
    func displayText(_ str: String) {
        displayLabel.text = String(str)
    }
    
    func clean () {
        secondEle = nil
        op = nil
        isFraction = false
        countFraction = 0
        divideButton.backgroundColor = UIColor.systemOrange
        multiplyButton.backgroundColor = UIColor.systemOrange
        minusButton.backgroundColor = UIColor.systemOrange
        plusButton.backgroundColor = UIColor.systemOrange
    }
    
    func calculate() {
        switch op {
        case "%":
            firstEle /= 100
            //display(str: String(firstEle))
        case "+/-":
            firstEle = -firstEle
            //display(str: String(firstEle))
        case "/":
            if let tempEle = secondEle {
                if tempEle == 0.0 {
                    displayText("Error")
                    return
                }
                else {
                    firstEle = firstEle/tempEle
                }
            }
        case "x":
            firstEle = firstEle * secondEle
        case "-":
            firstEle = firstEle - secondEle
        case "+":
            firstEle = firstEle + secondEle
        default:
            break

        }
        display(firstEle)
        clean()
            
    }
    
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        if op != nil && secondEle == nil {
            return
        }
        if secondEle != nil {
            calculate()
        }
        op = "%"
        calculate()
        firstEle = 0
            
    }
    
    @IBAction func opositeButtonPressed(_ sender: UIButton) {
        if op != nil && secondEle == nil {
            return
        }
        if secondEle != nil {
            calculate()
        }
        op = "+/-"
        calculate()
    }
    
    @IBAction func acButtonPressed(_ sender: UIButton) {
        firstEle = 0
        clean()
        display(0)
    }
    
    func calculateButtonPressed (_ button: UIButton,_ op_str: String) {
        if self.op != nil && secondEle == nil {
            return
        }
        if secondEle != nil {
            calculate()
        }
        button.backgroundColor = UIColor.systemPink
        self.op = op_str
        isFraction = false
    }
    

    @IBAction func divideButtonPressed(_ sender: UIButton) {
        calculateButtonPressed(divideButton, "/")
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        calculateButtonPressed(multiplyButton, "x")
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        calculateButtonPressed(minusButton, "-")
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        calculateButtonPressed(plusButton, "+")
    }

    
    func addNum (_ number: Float) {
        if op == nil {
            if isFraction == false {
                if firstEle >= 0 {
                    firstEle = firstEle * 10  + number
                }
                else {
                    firstEle = firstEle * 10  - number
                }
                
            }
            else {
                countFraction += 1
                if firstEle >= 0 {
                    firstEle = firstEle + round(number * pow(0.1, Float(countFraction)) * pow(10, Float(countFraction))) / pow(10, Float(countFraction))
                }
                else {
                    firstEle = firstEle - round(number * pow(0.1, Float(countFraction)) * pow(10, Float(countFraction))) / pow(10, Float(countFraction))
                }
                
            }
            
            display(firstEle)
        }
        else if secondEle == nil {
            if isFraction == false {
                secondEle = number
            }
            else {
                secondEle = number * 0.1
            }
            display(secondEle)
        }
        else {
            if isFraction == false {
                if secondEle >= 0 {
                    secondEle = secondEle * 10 + number
                }
                else {
                    secondEle = secondEle * 10 - number
                }
            }
            else {
                countFraction += 1
                if secondEle >= 0 {
                    secondEle = secondEle + round(number * pow(0.1, Float(countFraction)) * pow(10, Float(countFraction))) / pow(10, Float(countFraction))
                }
                else {
                    secondEle = secondEle - round(number * pow(0.1, Float(countFraction)) * pow(10, Float(countFraction))) / pow(10, Float(countFraction))
                }
            }
            display(secondEle)
        }
    }
    
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        addNum(1)
    }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        addNum(2)
    }
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        addNum(3)
    }
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        addNum(4)
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        addNum(5)
    }
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        addNum(6)
    }
    
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        addNum(7)
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        addNum(8)
    }
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        addNum(9)
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        addNum(0)
    }
    
    @IBAction func fractionButtonPressed(_ sender: UIButton) {
        isFraction = true
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        if op != nil {
            if op == "%" || op == "+/-" {
                calculate()
                firstEle = 0
            }
            else if secondEle != nil {
                calculate()
                firstEle = 0
            }
        }
    }
}

