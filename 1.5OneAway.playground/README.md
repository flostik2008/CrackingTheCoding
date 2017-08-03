```
/*
 _____5.___________________________________________________________________
 we can insert, delete, replace a char in a string. Givven 2 str, find if they are 1/0 edits away from another.
 
 input: 
 "pale" 'ple' -> true
 "pale" "bale" -> true
 'pale' 'bake' -> false
 
 
1. should be either different by one char or lack one char.
2. subract chars one by one. If more than one char left -> false.
3. sol from book: 
 if lengths the same -> check that only one difference.
 if 1st shorter than 2nd -> step through chars, if found difference, increse index for longer string(2nd). if occured again and indexes different -> false
 if 2nd shorter than 1st -> step throguh chars, if found diffence, increase index of longer string(1st). If occured again and indexes different -> false 
 (uses 2 pointers like in merge algo)
 
 */

func numbEdits(string1: String, string2: String) -> Bool {

    var s1 = Array(string1.characters)
    var s2 = Array(string2.characters)
   
    func diffLength(str1: [Character], str2: [Character]) -> Bool {
            // traverse strings with 'while' and 2 pointers. if chars different, increase index of longer string. If diffent again and indexes different -> false
        
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
        // if same length, only 1 char should be differnt.
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
