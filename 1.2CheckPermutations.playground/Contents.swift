//: Playground - noun: a place where people can play

import UIKit

/*
 _____2.___________________________________________________________________
 Given 2 strings, check if one is a permutation of another.
 Permutation - different combinations of given characters.
 
 input
 "asdfg"
 "dgsaf"
 - true
*/

func isPermutation(string1: String, string2: String) -> Bool {
    
    let s1 = Array(string1.characters).sorted()
    let s2 = Array(string2.characters).sorted()
    
    var i = 0
    
    if s1.count != s2.count {
        return false
    } else {
        while i<s1.count {
            if s1[i] != s2[i] {
                return false
            } else {
                i += 1
            }
        }
    }
    return true
}

func isPermutation2(string1: String, string2: String) -> Bool {
    
    var str2 = string2
    
    if string1.characters.count != string2.characters.count {
        return false
    } else {
        for i in string1.characters {
            print(i)
            if let h = str2.characters.index(of: i) {
                str2.remove(at: h)
            } else {
                return false
            }
        }
    }
    if str2.characters.count != 0 {
        return false
    }
    return true
}
