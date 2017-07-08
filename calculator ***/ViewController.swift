//
//  ViewController.swift
//  calculator ***
//
//  Created by Алексей Трубко on 05.07.17.
//  Copyright © 2017 Алексей Трубко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel! //  создали Дисплей результатов !
    var stillTyping = false
    var firstOperand : Double = 0 //первое значение на дисплее
    var secondOperand : Double = 0
    var operationSign : String  = "0"     // знак кнопки на которую мы нажимаем
    var curentInput : Double {
        get {return Double(displayResultLabel.text!)!
        }
        set { displayResultLabel.text = "\(newValue)"
        stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) { //cоздаем 1 кнопку Акшен
        let number = sender.currentTitle // выводит на экран то что написано на кропке
        
        if stillTyping {
            if (displayResultLabel.text?.characters.count)! < 20 {//задаем макс символы в дисплее
                displayResultLabel.text = displayResultLabel.text! + number!
            } //новове значение дисплея
        }
        else {
        displayResultLabel.text = number   //убираем 0 (начальное число дисплея)
           stillTyping = true
        }
    }
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle! // значение нажимаемой кнопки
        firstOperand = curentInput
        stillTyping = false
    }
    func operationWithTwoOperand (operation : (Double, Double) -> Double) {
    curentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    @IBAction func equalitySignPressed(_ sender: UIButton) { //создаем Знак "="
        if stillTyping{
            secondOperand = curentInput //сохроняет 2 вводимое значение
        }
        switch operationSign { // свич по значению команд
        case "+" : operationWithTwoOperand{$0 + $1}
        case "-" : operationWithTwoOperand{$0 - $1}
        case "×" : operationWithTwoOperand{$0 * $1}
        case "÷" : operationWithTwoOperand{$0 / $1}
        default: break
        
        }
    }
   
    @IBAction func sqrt(_ sender: Any) {
    }
}

