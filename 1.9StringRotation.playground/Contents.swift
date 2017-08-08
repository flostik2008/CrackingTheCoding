//: Playground - noun: a place where people can play

import UIKit

/*
 _____9.___________________________________________________________________
 String Rotation.
 We have a func 'isSubstring' that checks if a string is part of another string.
 Givven 2 strings s1 and s2, write func to check if one is a rotation of another, using only one call to 'isSubstring'.
 
 input -> "waterbottle" "erbottlewat"
 output -> true
 
 discussion: 
 If we double the string and then check if the other is part of it - we have a rotation. 
 */

func strRot(str1: String, str2: String) -> Bool {
    
    var double = str1 + str1
    if double.contains(str2) {
        return true
    }
    
    return false
}

var str1 = "waterbottle"
var str2 = "erbottlewat"

strRot(str1: str1, str2: str2)