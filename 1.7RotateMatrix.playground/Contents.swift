//: Playground - noun: a place where people can play

import UIKit

/*
 _____7.___________________________________________________________________
 Giving a 2D array (image/matrix), rotate that image by 90degrees.
 
 input:
 {{0,1,2} {3,4,5} {6,7,8}}
 -> {{6,3,0} {7,4,1} {8,5,2}}
 
 input:
 {{5,6,7,2} {8,0,9,1} {0,9,2,1} {9,8,2,3}}
 -> {{9,0,8,5} {8,9,0,6} {2,2,9,7} {3,1,1,2}}
 
 */

func rotate90(image: [[Int]]) -> [[Int]] {
    
    var res = [[Int]]()
    var intermid = [Int]()
    
    for i in 0..<image.count {
        intermid.removeAll()
        
        for p in 0..<image[i].count {
            
            intermid.append(image[p][i])
        }
        intermid.reverse()
        res.append(intermid)
    }
    print(res)
    return res
}

var img:[[Int]] = [[5,6,7,2], [8,0,9,1], [0,9,2,1], [9,8,2,3]]

// in place:
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
        }
    }
    
    return img
}

rotate90InPlace(image: img)