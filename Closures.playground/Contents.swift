//: Playground - noun: a place where people can play

import UIKit

/*
 闭包（Closures）
 闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似。
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作
 */

//  如何在 map(_:) 方法中使用尾随闭包将 Int 类型数组 [16, 58, 510] 转换为包含对应 String 类型的值的数组["OneSix", "FiveEight", "FiveOneZero"]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//  普通方式
var reverseResult = [String]()
var output = ""
for number in numbers {
    output = ""
    var num = number
    while num > 0 {
        let str: String = digitNames[num % 10]!
        num = num / 10
        output = str + output
    }
    reverseResult.append(output)
}
print("reverse result is \(reverseResult)")

//尾随闭包方式
let reverseStr = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}
print("reverse result str = \(reverseStr), type is \(type(of: reverseStr))")

//  有一个叫做 makeIncrementer 的函数，其包含了一个叫做 incrementer 的嵌套函数。嵌套函数 incrementer() 从上下文中捕获了两个值，runningTotal 和 amount。捕获这些值之后，makeIncrementer 将 incrementer 作为闭包返回。每次调用 incrementer 时，其会以 amount 作为增量增加 runningTotal 的值
func makeIncrementer(amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementer = makeIncrementer(amount: 10)
print("incrementer : \(incrementer())")
print("incrementer : \(incrementer())")
print("incrementer : \(incrementer())")
let incrementBySeven = makeIncrementer(amount: 7)
print("incrementBySeven() is \(incrementBySeven())")
print("incrementBySeven() is \(incrementBySeven())")
print("incrementBySeven() is \(incrementBySeven())")

//  逃逸闭包
//  当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
//  一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。举个例子，很多启动异步操作的函数接受一个闭包参数作为 completion handler。这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
var x = 10
func doSomething() {
    someFunctionWithEscapingClosure { x = 100 }
    someFunctionWithNonescapingClosure { x = 200 }
}
doSomething()
print("x = \(x)")
print("handlers: \(completionHandlers)")
completionHandlers.first?()
print("x = \(x)")

//  自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = { customersInLine.remove(at: 0) } //类型是()->String闭包func
print("provider : \(customerProvider)")
print(customersInLine.count)
print("Now serving \(customerProvider()) removed!")
print(customersInLine.count)
//      通过函数参数传递provider闭包func
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider()) removed!")
}
serve(customer: customerProvider)
serve(customer: { customersInLine.remove(at: 0) })
print("customersInLine is \(customersInLine)")
//      还可以将参数标记为 @autoclosure 来接收一个自动闭包
func serveOther(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider()) removed!")
}
serveOther(customer: customersInLine.remove(at: 0))
print("customersInLine is \(customersInLine)")

//      如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性
customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var collectionproviders : [() -> String] = []
func collectCustomerProviders(_ provider: @autoclosure @escaping () -> String) {
    collectionproviders.append(provider)
}
collectCustomerProviders(customersInLine.removeLast())
collectCustomerProviders(customersInLine.removeLast())
print("Collected \(collectionproviders.count) closures.")
print("customersInLine is \(customersInLine)")
for provider in collectionproviders {
    print("provider is \(provider())")
}
print("customersInLine is \(customersInLine)")
