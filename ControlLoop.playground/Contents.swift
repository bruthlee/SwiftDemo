//: Playground - noun: a place where people can play

import UIKit

/*
 控制流（Control Flow）
 */


/**
 游戏的规则如下：
 
 游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
 每一轮，你通过掷一个六面体骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
 如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
 如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去
 */
//  while实现方式
let squareCount = 25
var squareValue = [Int](repeating:0, count: squareCount+1)
squareValue[03] = +08
squareValue[06] = +11
squareValue[09] = +09
squareValue[10] = +02
squareValue[14] = -10
squareValue[19] = -11
squareValue[22] = -02
squareValue[24] = -08
print(squareValue)
var diceRoll = 0 //骰子数目
var square = 0   //当前位置
while square < squareCount {
    diceRoll = Int(arc4random() % UInt32(6) + UInt32(1)) //摇一摇
    square += diceRoll  //添加步数
    //添加规则
    if square < squareValue.count {
        square += squareValue[square]
    }
    print("骰子数：\(diceRoll), 当前步数: \(square)")
}
print("Game Over")

//  repeat...while...实现方式
diceRoll = 0
square = 0
repeat {
    diceRoll = Int(arc4random() % UInt32(6) + UInt32(1)) //摇一摇
    square += diceRoll  //添加步数
    //添加规则
    if square < squareValue.count {
        square += squareValue[square]
    }
    print("骰子数：\(diceRoll), 当前步数: \(square)")
} while square < squareCount
print("Game Over")

//  switch实现方式
diceRoll = 0
square = 0
while square < squareCount {
    diceRoll = Int(arc4random() % UInt32(6) + UInt32(1)) //摇一摇
    square += diceRoll  //添加步数
    switch square {
    case 3:
        square = 11
    case 6:
        square = 17
    case 9:
        square = 18
    case 10:
        square = 12
    case 14:
        square = 4
    case 19:
        square = 8
    case 22:
        square = 20
    case 24:
        square = 16
    default:
        break
    }
    print("骰子数：\(diceRoll), 当前步数: \(square)")
}
print("Game Over")

//  switch用法
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a": // 无效，这个分支下面没有语句
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//  区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//  元组匹配
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//  switch贯穿fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 1...9:
    description += " an integer,"
    fallthrough
default:
    description += " and in the range of (1,9)."
}
print(description)

//  匹配后值绑定（Value Bindings）
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//  Where: case 分支的模式可以使用where语句来判断额外的条件
//  由于最后一个 case 分支匹配了余下所有可能的值，switch语句就已经完备了，因此不需要再书写默认分支
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line y = x.")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line y = -x.")
case let (x, y):
    print("(\(x), \(y)) is just one point.")
}

//  复合匹配
//      当多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一个case后面，并且用逗号隔开。
//      当case后面的任意一种模式匹配的时候，这条分支就会被匹配。并且，如果匹配列表过长，还可以分行书写
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//  带标签的语句
//      声明一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字(introducor keyword)，并且该标签后面跟随一个冒号
square = 0
diceRoll = 0
gameLoop: while square != squareCount {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case squareCount:
        // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
        break gameLoop      //如果上述的break语句没有使用gameLoop标签，那么它将会中断switch语句而不是while循环
    case let newSquare where newSquare > squareCount:
        // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop
    default:
        // 合法移动，做正常的处理
        square += diceRoll
        square += squareValue[square]
    }
}
print("Game over!")

//  提前退出
//      像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else从句，如果条件不为真则执行else从句中的代码
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: [:])
greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])

//  检测 API 可用性
//      在它一般的形式中，可用性条件使用了一个平台名字和版本的列表。平台名字可以是iOS，macOS，watchOS和tvOS——请访问声明属性来获取完整列表。除了指定像 iOS 8 或 macOS 10.10 的大版本号，也可以指定像 iOS 8.3 以及 macOS 10.10.3 的小版本号
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
