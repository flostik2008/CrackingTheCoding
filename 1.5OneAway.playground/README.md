```
/*
 _____5.___________________________________________________________________
 we can insert, delete, replace a char in a string. Givven 2 str, find if they are 1/0 edits away from another.
 
 input: 
 "pale" 'ple' -> true
 "pale" "bale" -> true
 'pale' 'bake' -> false
 
 */

func numbEdits(string1: String, string2: String) -> Bool {

    var s1 = Array(string1.characters)
    var s2 = Array(string2.characters)
   
    func diffLength(str1: [Character], str2: [Character]) -> Bool {
        
        var i = 0
        var k = 0
        
        while i < str1.count && k < str2.count {
            if str1[i] != str2[k] {
                if k != i {
                    return false
                }
                k+=1
            } else {
                i+=1
                k+=1
            }
        }
        return true
    }
    
    
    if s1.count == s2.count {
        var difference = false
        for i in 0..<s1.count {
            if s1[i] != s2[i] {
                if difference {
                    return false
                } else {
                    difference == true
                }
            }
        }
    }
    if s1.count+1 == s2.count {
        return diffLength(str1: s1, str2: s2)
    }
    
    if s1.count == s2.count + 1 {
        return diffLength(str1: s2, str2: s1)
    }
  
    return true
}
```
