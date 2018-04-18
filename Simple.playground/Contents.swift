//: Playground - noun: a place where people can play

import UIKit

/**================================**/
/**简单值**/
/**================================**/

/*
 Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型
 */

var str = "Hello, playground"
/**
 简单值
 使用 let 来声明常量，使用 var 来声明变量。一个常量的值，在编译的时候，并不需要有明确的值，但是你只能为它赋值一次
 */
let conVar = 10
var varValue = 10.0
varValue = 100

/**
 如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割
 */
var floatValue : Float = 10.0
floatValue = 10.00

/**
 值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换
 */
var result = str + "10plus" + String(conVar)
//Excepted expression after operator
//result = str +

/**
 有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠
 */
let apples = 10
let oranges = 20
let applesSum = "I have \(apples) apples."
let orangesSum = "You have \(oranges) oranges."

/**
 使用 \() 来把一个浮点计算转换成字符串，并加上某人的名字，和他打个招呼
 */
let weightSum = "Is your weight \(varValue), Mical?"

/**
 使用方括号 [] 来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号
 */
var array = [1, 2, 3, 4]
//Cannot convert value of type 'String' to expected element type 'Int'
//array = ["a", "b", 4, "f", 10.0]
array[2] = 10
print("array: ",array)

var arrayOth = ["a", "b", "c"]
arrayOth[1] = "bruthlee"
print("arrayOth: ",arrayOth)

var dic : [String: String] = [
    "a" : "value1",
    "b" : "value2",
    "c" : "value3",
]
print("dic[a] = ", dic["a"] ?? "null")
print("dic = ", dic)
dic["b"] = "value222"
print("dic = ", dic)

/**
 要创建一个空数组或者字典，使用初始化语法
 */
var emptyArray = [String]()
emptyArray.append("b")
emptyArray.insert("a", at: 0)
emptyArray.append("c")
emptyArray.remove(at: 1)
print("emptyArray = ",emptyArray)

var emptyDic = [String: Float]()
emptyDic["a"] = 10.0
emptyDic["c"] = 55
emptyDic["a"] = 99
print("emptyDic ",emptyDic)

/**
 如果类型信息可以被推断出来，你可以用 [] 和 [:] 来创建空数组和空字典——就像你声明变量或者给函数传参数的时候一样
 最新sdk不支持，必须指定类型
 */
//var emptyArrayOther = []
//emptyArrayOther.append(10)
//emptyArrayOther.append(99)
//
//var emptyDicOther = [:]

/**
 使用 if 和 switch 来进行条件操作，使用 for-in、 for、 while 和 repeat-while 来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的
 */
if varValue > 10 {
    print("varValue(\(varValue)) > 10.")
}
//switch无需使用break
switch varValue {
    case 10:
        print("\(varValue) is 10.")
    case 100:
        print("\(varValue) is 100.")
    default:
        print("\(varValue) is not in swith.")
}
for item in arrayOth {
    print("item is ", item)
}
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
while(varValue > 0) {
    print("varValue : ", varValue)
    varValue -= 11
}
print("varValue = ",varValue)

/**
 在 if 语句中，条件必须是一个布尔表达式——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地与 0 做对比
 */
var optionalString: String? = "Hello"
print(optionalString == nil)

/**
 可以一起使用 if 和 let 来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是 nil 以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的
 */
var optionalName: String? = "John Appleseed"
var greeting : String = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
var optionalNil: String? = nil
greeting = "Hello!"
if let name = optionalNil {
    greeting = "\(greeting), \(name)"
}
print("此时greeting: ", greeting, "(说明上面if没有执行)")

/**
 另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替
 类似于？表达式
 */
let fullName = "John Appleseed"
greeting = "Hi, \(optionalNil ?? fullName)"
greeting = "Mr."
greeting = "Hi, \(greeting)"

/**
 switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等
 无需添加break
 后面default必须添加，否则报错: switch must be exhaustive
 */
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

/**
 使用 for-in 来遍历字典，需要两个变量来表示每个键值对。字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束
 */
var maxKey = ""
var maxNumber = 0
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
for (key, numbers) in interestingNumbers {
    print("key: \(key)")
    for number in numbers {
        print("number: \(number)")
        if number > maxNumber {
            maxNumber = number
            maxKey = key
        }
    }
}
print("maxKey: \(maxKey), maxNumber: \(maxNumber)")


/**
 使用 while 来重复运行一段代码直到不满足条件。循环条件也可以在结尾，保证能至少循环一次
 */
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
// do...white...
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

/**
 可以在循环中使用 ..< or ... 来表示范围
 使用 ..< 创建的范围不包含上界，如果想包含的话需要使用 ...
 */
var sum = 0
for i in 1..<10 {
    sum += i
}
print("sum = \(sum)")
sum = 0
for i in 1...9 {
    sum += i
}
print("sum = \(sum)")

let maxUInt = UInt8.max
let minUInt = UInt8.min
let max8Int = Int8.max
let min8Int = Int8.min
let max32Int = Int32.max
let min32Int = Int32.min
let max64Int = Int64.max
let min64Int = Int64.min
let maxInt = Int.max
let minInt = Int.min

let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

// 如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp的乘积
let exp1 = 1.25e2
let exp2 = 1.25e-2

// 如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
let exp3 = 0xFp2
let exp4 = 0xFp-2

// 下面的这些浮点字面量都等于十进制的12.1875：
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// 整数和浮点数转换
let sum1 = Double(decimalInteger) + decimalDouble
let ceilInt = ceilf(10/3.0)
let floorInt = floorf(10/3.0)

// 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// 还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// Swift 的 Int 类型有一种构造器，作用是将一个 String 值转换成一个 Int 值。然而，并不是所有的字符串都可以转换成一个整数。字符串 "123" 可以被转换成数字 123 ，但是字符串 "hello, world" 不行
// 因为该构造器可能会失败，所以它返回一个可选类型（optional）Int，而不是一个 Int。一个可选的 Int 被写作 Int? 而不是 Int。问号暗示包含的值是可选类型，也就是说可能包含 Int 值也可能不包含值。（不能包含其他任何值比如 Bool 值或者 String 值。只能是 Int 或者什么都没有。）
let possibleNumber = "world"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
else {
    print("convertedNumber is not contains some integer value.")
}

// 可以给可选变量赋值为nil来表示它没有值：
// nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型
var serverResponseCode: Int? = 404 // serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil  // serverResponseCode 现在不包含值

// 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

// 你可以在可选绑定中使用常量和变量。如果你想在if语句的第一个分支中操作 actualNumber 的值，你可以改成 if var actualNumber，这样可选类型包含的值就会被赋给一个变量而非常量。
let possibleInt = "5"
if var actualInt = Int(possibleInt) {
    actualInt *= 2;
}
else {
    print("\(possibleInt) could not be converted to an integer")
}

// 可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理
if let first = Int("2"), let second = Int("4"), first < second && second < 10 {
    let mul = 10 * first * second
    print("\(first) * \(second) * 10 = \(mul)")
}
if let firstNumber = Int("2") {
    if let secondNumber = Int("4") {
        if firstNumber < secondNumber && secondNumber < 10 {
            print("\(firstNumber) < \(secondNumber) < 10")
        }
    }
}

// 一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值
// 如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

// 错误处理
// do-catch
/**
 在此例中，makeASandwich()（做一个三明治）函数会抛出一个错误消息如果没有干净的盘子或者某个原料缺失。因为 makeASandwich() 抛出错误，函数调用被包裹在 try 表达式中。将函数包裹在一个 do 语句中，任何被抛出的错误会被传播到提供的 catch 从句中。
 
 如果没有错误被抛出，eatASandwich() 函数会被调用。如果一个匹配 SandwichError.outOfCleanDishes 的错误被抛出，washDishes() 函数会被调用。如果一个匹配 SandwichError.missingIngredients 的错误被抛出，buyGroceries(_:) 函数会被调用，并且使用 catch 所捕捉到的关联值 [String] 作为参数。
 */
/*
func makeASandwich() throws {
    // ...
}
do {
    try makeASandwich()
    print("eatASandwich()")
} catch SandwichError.outOfCleanDishes {
    print("washDishes()")
} catch SandwichError.missingIngredients(let ingredients) {
    print("buyGroceries(\(ingredients))")
}
*/

// 使用断言进行调试
// 可以调用 Swift 标准库的 assert(_:_:file:line:) 函数来写一个断言。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示
let age = -3
//如果是false，则会出现error，并且阻塞代码向下执行
//assert(age >= 0, "A person's age cannot be less than zero")

// 如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:)函数来表明断言失败了，例如：
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    print("A person's age can't be less than zero.")
    //assertionFailure("A person's age can't be less than zero.")
}

// 强制执行先决条件
// 当一个条件可能为false（假），但是继续执行代码要求条件必须为true（真）的时候，需要使用先决条件。例如使用先决条件来检查是否下标越界，或者来检查是否将一个正确的参数传给函数。
// 你可以使用全局 precondition(_:_:file:line:) 函数来写一个先决条件。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示
//precondition(age > 0, "Age must be greater than zero.")

let mode1 = 10 % 4
let mode2 = -10 % 4

// 存有布尔类型的元组不能被比较,优先级从左往右递减
("blue", -1) < ("purple", 1)       // 正常，比较的结果为 true
("blue", 1) < ("purple", 0)        // 错误，因为 < 不能比较布尔类型

// Swift 标准库只能比较七个以内(<= 6)元素的元组比较函数。如果你的元组元素超过七个(>= 7)时，你需要自己实现比较运算符
let turple1 = (1, 2, 3, 4, 5, 6)
let turple2 = (1, 2, 3, 4, 7, 8)
turple1 < turple2
let turple3 = (1, 2, 3, 4, 5, 7)
let turple4 = (1, 2, 3, 4, 5, 6)
turple3 < turple4

// 空合运算符（Nil Coalescing Operator）
// 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致
let nco = convertedNumber != nil ? convertedNumber! : 10
let ncoo = convertedNumber ?? 10

// 区间运算符（Range Operators）
// 闭区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

// 半开区间运算符
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
print("===================")
// 单侧区间
for name in names[2...] {
    print(name)
}
print("===================")
for name in names[...2] {
    print(name)
}
print("===================")
for name in names[..<2] {
    print(name)
}

// 单侧区间不止可以在下标里使用，也可以在别的情境下使用。你不能遍历省略了初始值的单侧区间，因为遍历的开端并不明显。你可以遍历一个省略最终值的单侧区间；然而，由于这种区间无限延伸的特性，请保证你在循环里有一个结束循环的分支。你也可以查看一个单侧区间是否包含某个特定的值，就像下面展示的那样
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

// 逻辑运算符（Logical Operators）
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true
// Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
if enteredDoorCode && passedRetinaScan || hasDoorKey && knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
