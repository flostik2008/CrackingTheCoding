//: Playground - noun: a place where people can play

import UIKit

/*
 ______3.___________________________________________________________________
 Magic Index.
 In array A[0...n-1], a magic index is A[i] = i.
 Given a sorted arrays of distinct ints, write a method to find magic index.
 
 Input: sorted, distinct [-4, -2, 0, 3, 5, 6, 8]
 Output: magic index = 3, A[3] = 3
 
 Discussion:
 
 Because it is sorted and distinct ->
 if a[x] > x we can stop.
 
 Binary search approach -> we look at the middle. If a[x] > x, we look at the left part. If not, we look at the right part. Keep splitting until we find a[x] = x
 
 
 
 */

func magicIndex(arr: [Int], count: Int) -> Int? {
    //base case
    if count == 0 {
        return nil
    }
    if arr[count] == count {
        return count
    }
    
    // recursive case
    return magicIndex(arr: arr, count: count - 1)
}

var arr = [-4, -2, 0, 3, 5, 6, 8]
magicIndex(arr: arr, count: arr.count-1)

// solution 2
func magicIndex2(arr: [Int]) -> Int? {
    
    return magicIndexHelper2(arr, 0, arr.count-1)
}

func magicIndexHelper2(_ arr: [Int], _ start: Int, _ end: Int) -> Int? {
    if start > end {
        return nil
    }
    
    var midInd = (start + end)/2
    
    if arr[midInd] > midInd {
        magicIndexHelper2(arr, start, midInd - 1)
    }
    
    if arr[midInd] < midInd {
        magicIndexHelper2(arr, midInd + 1, end)
    }
    
    if arr[midInd] == midInd {
        return midInd
    }
    
    return nil
}

magicIndex2(arr: arr)

// if elements aren't distinct.
func magicIndex3(arr: [Int]) -> Int? {
    
    return magicIndexHelper3(arr, 0, arr.count-1)
}

func magicIndexHelper3(_ arr: [Int], _ start: Int, _ end: Int) -> Int? {
    if start > end {
        return nil
    }
    
    var midInd = (start + end)/2
    var midValue = arr[midInd]
    if midInd == midValue {
        return midInd
    }
    
    //search left part
    var leftIndex = min(midInd - 1, midValue)
    var left = magicIndexHelper3(arr, start, leftIndex)
    if left! >= 0 {
        return left
    }
    
    //search right part
    var rightIndex = max(midInd + 1, midValue)
    var right = magicIndexHelper3(arr, rightIndex, end)
    return right
}
