1.6 String Compression

```
import UIKit

/*
 _____6.___________________________________________________________________
 Compress string by counting consecutive chars. If result longer than original - return original.
 
 input:
 aabcccccaaa
 -> a2b1c5a3
 */

func compressString(string: String)-> String {
    
    var str = Array(string.characters)
    var repeatingCount = 0
    var result = ""
    for i in 0..<str.count {
        
        repeatingCount += 1
        if i+1 >= str.count || str[i] != str[i+1]{
            
            result = result + String(str[i]) + String(repeatingCount)
            repeatingCount = 0
        }
    }
  
    return result.characters.count > string.characters.count ? string : result
}

var str = "aabccccc"
compressString(string: str)

// Complexity of this algo is O(n + K^2) - where n - number of chars in input string, k - number of sequences. The reason is when we do "result = result + something", we creat a new string and copy old one char by char. To avoid this, we should use StringBuilder data struct, where concatenation of a string happens faster (becuase .append method)

```
