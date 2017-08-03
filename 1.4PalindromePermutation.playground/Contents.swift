//: Playground - noun: a place where people can play

import UIKit

/*
 _____4.___________________________________________________________________
 Check if a given string is a permutation of a polindrome.
 
 input: "Tact Coa"
 -> true, cuz "Taco Cat" "Atco Cta"
 
*/

func isPermOfPol(string: String) -> Bool {
    
    var str = Array(string.lowercased().characters)
    var dict = [Character:Int]()
    var nonDubles = 0
    
    for i in str {
        if dict[i] == nil {
            dict[i] = 1
        } else {
            dict[i]! += 1
        }
    }
    
    for (char, count) in dict {
        if count != 2 {
            if char == Character(" ") {
                continue
            }
            
            if nonDubles > 1 {
                return false
            } else {
                nonDubles += 1
            }
        }
        
    }
    return true
}
