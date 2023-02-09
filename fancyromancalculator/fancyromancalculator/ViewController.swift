//
//  ViewController.swift
//  fancyromancalculator
//
//  Created by T65713 on 2.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func onClear(_ sender: Any) {
        inputTextField.text = ""
        resultLabel.text = ""
    }
    
    enum errors : Error{
        case invalidInput
        case invalidCharacter(message:String)
    }
    
    let romanNumbers : [Character] = ["I", "V", "X", "L", "C", "D", "M"]
    
    @IBAction func onCalculate(_ sender: Any) {
        if let input = inputTextField.text {
            
            for index in input.indices {
                if (!romanNumbers.contains(input[index])){
                    resultLabel.text = "Hatalı giriş"
                    return
                }
            }
            
            do {
                let result = try calculate(input: input)
                resultLabel.text = String(result)
                
            } catch errors.invalidCharacter(let message) {
                resultLabel.text = message
            }
            catch errors.invalidInput {
                resultLabel.text = "Hatalı giriş"
            }
            catch {
                print("Unexpected error: \(error).")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func calculate (input : String) throws -> Int
    {
        var result : Int = 0
        //IV IX VX XL XC
        
        let characters = Array(input)
        var i : Int = 0
        
        while true {
            if i >= characters.count{
                break
            }
            
            let current = characters[i]
            var nextCharacter : Character = Character(" ");
            
            
            if i+1 != characters.count{
                nextCharacter = characters[i+1]
            }
            
            if(current == "I"){
                if(nextCharacter == "X"){
                    result += 9
                    i += 2
                    continue
                }
                
                if(nextCharacter == "V"){
                    result += 4
                    i += 2
                    continue
                }
                result += 1
            }
            
            if(current == "V"){
                result += 5
                if(nextCharacter != "I")
                {
                    throw errors.invalidCharacter(message:"Hata:\(nextCharacter)")
                }
            }
            
            if(current == "X"){
                if(nextCharacter == "C"){
                    result += 90
                    i += 2
                    continue
                }
                
                if(nextCharacter == "L"){
                    result += 40
                    i += 2
                    continue
                }
                result += 10
            }
            
            if(current == "L"){
                result += 50
                if(nextCharacter == "C" || nextCharacter == "D" || nextCharacter == "M")
                {
                    throw errors.invalidCharacter(message:"Hata:\(nextCharacter)")
                }
                
            }
            
            
            if(current == "C"){
                if(nextCharacter == "M"){
                    result += 900
                    i += 2
                    continue
                }
                
                if(nextCharacter == "D"){
                    result += 400
                    i += 2
                    continue
                }
                result += 100
            }
            
            if(current == "D"){
                result += 500
                if(nextCharacter == "M")
                {
                    throw errors.invalidCharacter(message:"Hata:\(nextCharacter)")
                }
            }
            
            
            if(current == "M"){
                result += 1000
            }
            
            
            i += 1
        }
        
        return result
    }
}

