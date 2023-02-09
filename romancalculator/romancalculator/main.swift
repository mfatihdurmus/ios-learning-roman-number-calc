//
//  main.swift
//  romancalculator
//
//  Created by T65713 on 2.02.2023.
//

import Foundation

func calculate (input : String) -> Int
{
    var result : Int = 0
    //IV IX V XL XC
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
            //kendisinden küçük sayılar gelebilir değilse hata
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
            //kendisinden küçük sayılar gelebilir değilse hata
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
            //kendisinden küçük sayılar gelebilir değilse hata
        }
        
        
        if(current == "M"){
            result += 1000
        }
        
        
        i += 1
    }
    
    return result
}


print(calculate(input:"MCLCXIII"))
