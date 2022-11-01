//
//  ViewController.swift
//  conversores
//
//  Created by Tiago & Karina on 21/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBOutlet weak var btUnit1: UIButton!
    
    @IBOutlet weak var btUnit2: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultUnitLabel: UILabel!
    
    
    @IBOutlet weak var unitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch unitLabel.text! {
        case "Temperatura" :
            unitLabel.text = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
            
        case "Peso" :
            unitLabel.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
            
        case "Moeda" :
            unitLabel.text = "Distancia"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
            
        default:
            unitLabel.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Fahrenheit", for: .normal)
            
        }
        convertButton(nil)
    }
    
    @IBAction func convertButton(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch unitLabel.text! {
        case "Temperatura" :
            calcTemperature()
        case "Peso" :
            calcWeight()
        case "Moeda" :
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(resultLabel.text!)!
        resultLabel.text = String(format: "%.2f", result)
    }
    func calcTemperature() {
        guard let temperature = Double(valueTextField.text!) else {return}
        if btUnit1.alpha == 1.0 {
            resultUnitLabel.text = "Fahrenheit"
            resultLabel.text = String(temperature * 1.8 + 32.0)
        }else{
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temperature - 32.0) / 1.8)
        }
        
    }
    func  calcWeight() {
        guard let weight = Double(valueTextField.text!) else {return}
        if btUnit1.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weight / 2.2046)
        }else{
            resultUnitLabel.text = "Kilômetro"
            resultLabel.text = String(weight * 2.2046)
        }
        
    }
    func calcCurrency() {
        guard let currency = Double(valueTextField.text!) else {return}
        if btUnit1.alpha == 1.0 {
            resultUnitLabel.text = "Dolár"
            resultLabel.text = String(currency / 5.24)
        }else{
            resultUnitLabel.text = "Real"
            resultLabel.text = String(currency * 5.24)
        }
        
    }
    func calcDistance(){
        guard let distance = Double(valueTextField.text!) else {return}
        if btUnit1.alpha == 1.0 {
            resultUnitLabel.text = "Kilômetro"
            resultLabel.text = String(distance / 1000.0)
        }else{
            resultUnitLabel.text = "Metros"
            resultLabel.text = String(distance * 1000.0)
        }
    }
}


