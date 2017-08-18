//: Playground - noun: a place where people can play

import UIKit

/*
 _____2.___________________________________________________________________
 Robot in a Grid.
 Robot sits in upper left corner, r rows, c columns. He can move only right and down.
 Design an algo, to find a path from top left to bottom right.
 
 Discussion:
 - to get to position (r,c) robot should be on squares (r-1,c) or (r,c-1).
 to get to (r-1,c), robot should be on squares (r-2,c) or (r-1, c-1)
 etc...
 
 We write 2 methods. "getPath" takes a specified boolean matrix. Inside, there is a call for helper func. Inside helper func - recursive call of itself.
 
 "getPath" first check if we were givin a lagit boolean matrix and number of rows. That is not a base case, but simpel check.
 We create an empty array of "Point" instances - this will be our result path. We will pass that path as argument to our helper methods and after each call it will get filled.
 
 We call "helper" func and wrap it into 'if' statement. If func returns a value, we will return path.
 
 "helper" func takes 4 arguments:
 - original boolean matrix(it won't be changed on recursive calls)
 - row integer and column integer. We will be -1 from them on recursive calls.
 - path, array of Points. That is our result and we simply fill it after each recursive call.
 Base case - if we gotten at the beggining of the matrix "if col<0 || row<0..." -> return false. Recursive tree will start folding (aka stops addding points to the 'path' array)
 
 We add a boolean "isAtOrigin" that is true if we are at origin.
 
 Recursive case - we call 'helper' func on (r-1;c) and (r;c-1) and check if "isAtOrigin == true" (in case if helper func returned 'false')
 
 */

class Point: Hashable, Equatable {
    var rowCoord: Int
    var columnCoord: Int
    
    init(_ r: Int, _ c: Int) {
        self.rowCoord = r
        self.columnCoord = c
    }
    
    var hashValue: Int {
        get {
            return ObjectIdentifier(self).hashValue
        }
    }
    
    static func ==(onePoint: Point, anotherPoint: Point) -> Bool {
        return onePoint.columnCoord == anotherPoint.columnCoord && onePoint.rowCoord == anotherPoint.rowCoord
    }
}

func getPath(boolMatrix:[[Bool]]?) -> [Point]? {
    if boolMatrix == nil || boolMatrix?.count == 0 {
        return nil
    }
    
    var path = [Point]()
    
    if helper(boolMatrix: boolMatrix!, row: (boolMatrix?.count)! - 1, col: (boolMatrix?[0].count)! - 1, path: path) {
        return path
    }
    return nil
}

func helper(boolMatrix:[[Bool]], row:Int, col:Int, path:[Point])-> Bool {
    
    var varPath = path
    
    if row < 0 || col < 0 || !boolMatrix[row][col] {
        return false
    }
    
    var isOrigin = (row == 0 && col == 0)
    
    if isOrigin || helper(boolMatrix: boolMatrix, row: row-1, col: col, path: varPath) || helper(boolMatrix: boolMatrix, row: row, col: col-1, path: varPath) {
        var point = Point(row, col)
        varPath.append(point)
        return true
    }
    
    return false
}

//To speed up this algo, use a dictionary to save visited squares.

func getPath2(boolMatrix:[[Bool]]?) -> [Point]? {
    if boolMatrix == nil || boolMatrix?.count == 0 {
        return nil
    }
    
    var path = [Point]()
    var failedPoints = [Point:Bool]()
    
    if helper2(boolMatrix!, (boolMatrix?.count)! - 1, (boolMatrix?[0].count)! - 1, path,  failedPoints) {
        return path
    }
    return nil
}

func helper2(_ matrx: [[Bool]],_ row:Int,_ col:Int,_ path:[Point],_ dict: [Point:Bool]) -> Bool {
    
    var varPath = path
    
    if row < 0 || col < 0 || !matrx[row][col] {
        return false
    }
    
    var point = Point(row, col)
    if dict[point] == true {
        return false
    }
    
    var isOrigin = (row == 0 && col == 0)
    
    if isOrigin || helper2(matrx,  row-1, col, varPath, dict) || helper2(matrx, row, col-1, varPath, dict) {
        var point = Point(row, col)
        varPath.append(point)
        return true
    }
    
    dict[point] == true
    return false
}

