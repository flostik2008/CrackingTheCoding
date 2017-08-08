//: Playground - noun: a place where people can play

import UIKit

/*
 _____1.___________________________________________________________________
 Stairs with n steps. Can hop 1, 2 and 3 steps at the time.
 Count how many ways a child can run up the stairs.
 
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...
 0 -> 1 or 0 -> 2 or 0 -> 3. Each step he has 3 options how to proceed next. 
 
 Logic of this algo
 - if there is 0 steps left - we have 1 way.
 - for each number of steps - there are 3 ways getting there and we add them up.
 To every step that kid can end up, he could've done 1, 2 or 3 hops to end up on that step.
 So on each call we have sum of ways, each of them, if the substraction = 0 - means he succeded and we have 1 way.
 
 
 */

func countWaysFor(s: Int) -> Int {
    if s < 0 {
        return 0
    } else if s == 0 {
        return 1
    } else {
        return countWaysFor(s: s - 1) + countWaysFor(s: s - 2) + countWaysFor(s: s - 3)
    }
}