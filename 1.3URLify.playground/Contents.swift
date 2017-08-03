//: Playground - noun: a place where people can play

import UIKit

/*
 _____3._______________________________________________________________________
 func, takes a string, replaces all " " with "%20".
 
 input:
 "hello there pupkin"
 -> "hello%20there%20pupkin"
 
 */

func replaceSpaces(string: String) -> String {
    
    var str = Array(string.characters.map{String($0)})
    
    for i in 0..<str.count {
        if str[i] == " " {
            str[i] = "%20"
        }
    }
    
    return str.joined()
}
