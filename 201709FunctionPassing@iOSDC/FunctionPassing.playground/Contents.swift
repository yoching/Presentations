//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//let array: [Int] = [1, 2, 3]
//
//array.map { number -> Int in
//    return number * 2
//}

// 先に関数を定義
//func twoTimes(of number: Int) -> Int {
//    return number * 2
//}
//
//
//let array: [Int] = [1, 2, 3]
//array.map(twoTimes) // 関数を渡す


func someFunc(a: Int, b: Int) -> String {
    return "a: \(a), b: \(b)"
}

// タプルは渡せない
let parameters = (a: 0, b: 0)
//someFunc(parameters) // 🙅（swift3~）


// mapだと渡せる？
//let array: [(Int, Int)] = [(0, 0)]
//array.map(someFunc) // 🙆（swift3でも）

let someFunc2 = someFunc
someFunc2(parameters)

