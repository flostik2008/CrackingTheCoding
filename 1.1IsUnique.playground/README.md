```
/*
____1._______________________________________________________________________
 Write algo, to find if a string has all unique chars.
 What if i can't use additional data structures?
 
 - iterate through string. Check if its in a dict. If not->Add. If yes - return false.
*/


func findUniq(string: String) -> Bool {
    
    var dict = [Character:Bool]()
    
    for i in string.characters {
        if dict[i] != true {
            dict[i]=true
        } else {
            return false
        }
    }
    
    return true
}

// without dict
func findUniq2(string: String) -> Bool {
    
    for (index1, i) in string.characters.enumerated() {
        for (index2, k) in string.characters.enumerated() {
            if i == k && index1 != index2 {
                return false
            }
        }
    }
    return true
}

// less iterations. Start second loop from position of the bigger loop. 
func findUniq3(string: String) -> Bool {
    
    for i in 0..<string.characters.count-1 {
        for k in i+1..<string.characters.count {
            if Array(string.characters)[i] == Array(string.characters)[k] {
                return false
            }
        }
    }
    return true
}

```
