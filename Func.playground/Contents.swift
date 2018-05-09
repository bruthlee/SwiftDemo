//: Playground - noun: a place where people can play

import UIKit

/**================================**/
/**函数和闭包**/
/**================================**/

/**
 使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型
 */
func greeting(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
let greetingStr = greeting(name: "John", day: "25")
print("greeting: ", greetingStr)

//删除 day 参数，添加一个参数来表示今天吃了什么午饭
func meeting(name: String, food: String) -> Void {
    print("Oh dear, \(name) want to eat \(food)")
}
meeting(name: "Kunfoo", food: "muscle")


/**
 在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签
 */
func greet(_ name: String, on day: String) -> Void {
    print("Hello \(name), today is \(day)")
}
greet("James", on: "Wednesday")

/**
 使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示
 */
func calculateStatics(scores: [Int]) -> (max: Int, min: Int, sum: Int) {
    var max = scores[0]
    var min = scores[0]
    var sum = 0
    for number in scores {
        if max < number {
            max = number
        }
        else if min > number {
            min = number
        }
        sum += number
    }
    return (max, min, sum)
}
let calculateResult = calculateStatics(scores: [5, 1, 3, 9, 2])
print("max = ", calculateResult.max, ", min = ", calculateResult.min, ", sum = ", calculateResult.sum)
print("couple[2] = ", calculateResult.2)

/**
 函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
 */
func sumArray(numbers: Int...) -> Int {
    var sum = 0;
    for number in numbers {
        sum += number
    }
    return sum
}
print("sumArray[] = ", sumArray(numbers:))
print("sumArray[1,2,3] = ", sumArray(numbers: 1, 2, 3))

/**
 写一个计算参数平均值的函数
 */
func averageArray(numbers: Int...) -> Int {
    let count = numbers.count
    var sum = 0
    for number in numbers {
        sum += number
    }
    let average = sum / count
    return average
}
print("averageArray[] = ", averageArray(numbers:))
print("averageArray[1,2,3] = ", averageArray(numbers: 1, 2, 3))

//  一个函数只允许最多出现一个可变参数，下面示例报错
//func averageDouble(numbers1:Double..., numbers2:Double...) {
//
//}

/**
 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数
 */
func returnFifteen() -> Int {
    var num = 10
    func add() {
        num += 5
    }
    add()
    return num
}
print("returnFifteen = \(returnFifteen())")

/**
 函数是第一等类型，这意味着函数可以作为另一个函数的返回值
 */
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print("increment(2) = ", increment(2))

/**
 函数也可以当做参数传入另一个函数
 */
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for number in list {
        if lessThanTen(number: number) {
            return true
        }
    }
    return false
}
let matchNumbers = [20, 19, 7, 12]
let matchResult = hasAnyMatches(list: matchNumbers, condition: lessThanTen)
print("matchResult = ", matchResult)

/**
 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。
 闭包中的代码能访问闭包作用域中的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数的例子中看过了。
 你可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离
 */
matchNumbers.map({
    //声明
    (number: Int) -> Int in
    //闭包函数体
    let result = 3 * number
    return result
})
print("mappedNumbers: ", matchNumbers)

// 重写闭包，对所有奇数返回 0
matchNumbers.map({
    (number: Int) -> Bool in
    let result = number % 2 != 0
    return result
})
print("mappedNumbers: ", matchNumbers)

/**
 如果一个闭包的类型已知，比如作为一个代理的回调，你可以忽略参数，返回值，甚至两个都忽略。单个语句闭包会把它语句的值当做结果返回
 */
let mappedNumbers = matchNumbers.map({
    number in 3 * number
})
print("mappedNumbers: ", mappedNumbers)

/**
 可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号
 */
let sortedNumbers = matchNumbers.sorted {
    $0 < $1
}
print("sortedNumbers: ", sortedNumbers)

//  输入输出参数inout
func swapTwoInts(a: inout Int, b: inout Int) {
    let temp = b
    b = a
    a = temp
}
var swapNum1 = 2
var swapNum2 = 3
print("swap: \(swapNum1), \(swapNum2)")
swapTwoInts(a: &swapNum1, b: &swapNum2)
print("swap: \(swapNum1), \(swapNum2)")

//  sorted方法
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let namesSorted1 = names.sorted() {
    $0 > $1
}
print("names is \(names)")
print("sortedNames1 is \(namesSorted1)")
//  如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
let namesSorted2 = names.sorted {
    $0 > $1
}
print("sortedNames2 is \(namesSorted2)")
//  通过类型推断后缩写
let namesSorted3 = names.sorted(by: {s1, s2 in s1 > s2})
print("sortedNames3 is \(namesSorted3)")
//  通过String自带>（大于号字符串实现）方法
let namesSorted4 = names.sorted(by: >)
print("sortedNames4 is \(namesSorted4)")

/// 在实例方法中修改值类型
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

/// 不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性
//let fixedPoint = Point(x: 3.0, y: 3.0) //此时是常量而非变量
//fixedPoint.moveByX(2.0, y: 3.0)

/// 可变方法能够赋给隐含属性self一个全新的实例。上面Point的例子可以用下面的方式改写：
struct OtherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = OtherPoint(x: x + deltaX, y: y + deltaY)
    }
}
var otherPoint = OtherPoint(x: 1.0, y: 1.0)
print("otherPoint is \(otherPoint)")
otherPoint.moveBy(x: 2.0, y: 3.0)
print("otherPoint is \(otherPoint)")
print("The point is now at (\(otherPoint.x), \(otherPoint.y))")

/// 枚举的可变方法可以把self设置为同一枚举类型中不同的成员
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
print("ovenlight 1 is \(ovenLight)")
ovenLight.next()
print("ovenlight 2 is \(ovenLight)")
ovenLight.next()
print("ovenlight 3 is \(ovenLight)")
