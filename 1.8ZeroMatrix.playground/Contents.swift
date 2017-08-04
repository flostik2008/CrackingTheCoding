//: Playground - noun: a place where people can play

import UIKit

/*
 _____8.___________________________________________________________________
 MxN matrix. If there is 0 -> turn its row and column into 0s.
 
 4 6 9 3 2      4 6 0 0 2
 1 8 7 0 3      0 0 0 0 0
 4 6 2 5 1  ->  4 6 0 0 1
 3 2 0 9 7      0 0 0 0 0
 
*/
 
func zeroMatrix2(matrix: [[Int]]) -> [[Int]] {
    var result = matrix
    var arrayOfCoord = [[Int]]()
    for i in 0..<result.count {
        for k in 0..<result[0].count {
            if result[i][k] == 0 {
                var ar = [i, k]
                arrayOfCoord.append(ar)
            }
        }
    }
    print(arrayOfCoord)
    // func make zeroCross (rows: Int columns: Int)
    
    for p in 0..<arrayOfCoord.count {
        var pook = arrayOfCoord[p]
        result = makeZeroCross(mat: result, rows: pook[0], columns: pook[1])
    }
    
    print("\(result[0])\n\(result[1])\n\(result[2])\n\(result[3])\n")
    return result
}

func makeZeroCross (mat: [[Int]], rows:Int, columns:Int) -> [[Int]] {
    var result = mat
    var width = result[0].count
    var hight = result.count
    
    result[rows] = Array(repeating: 0, count: width)
    
    for i in 0..<hight {
        result[i][columns] = 0
    }
    
    return result
}

var matrix = [[4, 6, 9, 3, 2], [1, 8, 7, 0, 3], [4, 6, 2, 5, 1], [3, 2, 0, 9, 7]]
zeroMatrix2(matrix: matrix)

