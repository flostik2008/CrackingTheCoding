```
var img:[[Int]] = [[5,6,7,2], [8,0,9,1], [0,9,2,1], [9,8,2,3]]

print("\(img[0])\n\(img[1])\n\(img[2])\n\(img[3])\n")

func rotate90InPlace(image: [[Int]]) -> [[Int]]? {
    
    
    
    var img = image
    if img.count == 0 || img[0].count != img.count { return nil }
    
    var n = img.count
    
    for layer in 0..<n/2 {
        
        var first = layer
        var last = n-1-layer
        
        for i in first..<last {
            
            var offset  = i - first
            
            // save top
            var top = img[first][i]
            
            // shift left -> top.
            img[first][i] = img[last-offset][first]
            
            // shift bottom -> left, k will be chanching, but i will not exceed n/2
            img[last-offset][first] = img[last][last - offset]
            
            // shift right -> bottom
            img[last][last-offset] = img[i][last]
            
            // shifte saved top to right
            img[i][last] = top
            print("\(img[0])\n\(img[1])\n\(img[2])\n\(img[3])\n")
            print("_______________________")
        }
    }
    
    return img
}

rotate90InPlace(image: img)
```
