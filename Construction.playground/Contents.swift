//: Playground - noun: a place where people can play

import UIKit

/**
 构造过程:
     存储属性的初始赋值
     自定义构造过程
     默认构造器
     值类型的构造器代理
     类的继承和构造过程
     可失败构造器
     必要构造器
     通过闭包或函数设置属性的默认值
     构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例可用前必须执行这个过程，具体操作包括设置实例中每个存储型属性的初始
 值和执行其他必须的设置或初始化工作。
     通过定义构造器来实现构造过程，这些构造器可以看做是用来创建特定类型新实例的特殊方法。与 Objective-C 中的构造器不同，Swift 的构
 造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
     类的实例也可以通过定义析构器在实例释放之前执行特定的清除工作。想了解更多关于析构器的内容，请参考析构过程。
 **/

/// 存储属性的初始赋值
///     1.通过构造方法
struct Fahrenheit {
    var temp : Double
    init() {
        temp = 32.0
    }
}
///     2.通过直接赋值（推荐）--默认属性值
struct FahrenheitOther {
    var temp = 32.0
}

/// 自定义构造过程
///     1.构造参数
struct Celsius {
    var temp = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temp = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temp = kelvin - 273.15
    }
}
///     2.参数的内部名称和外部名称
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
///     3.不带外部名的构造器参数
struct CelsiusOther {
    let temp: Double
    init(_ celsius: Double) {
        temp = celsius
    }
}
///     4.可选属性类型:可选类型的属性将自动初始化为nil，表示这个属性是有意在初始化时设置为空的
class Robot {
    let question: String    //构造过程中常量属性的修改,之后不能被修改
    var answer: String?
    init(question: String) {
        self.question = question
    }
    func result() {
        if answer != nil {
            print("The answer of question [\(question)] is \(String(describing: answer)).")
        }
        else {
            print("The answer of question [\(question)] is empty.")
        }
    }
}
let robot = Robot(question: "What't your name?")
robot.result()
robot.answer = "hollywater"
//robot.question = ""   ///报错，常量不能修改
robot.result()
///         5.结构体的逐一成员构造器
struct Size {
    var width, height: Double
}
let size = Size(width: 20.0, height: 50.0)
print("size is \(size)")

/**
 可失败构造器
 */
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil  //可失败构造器
        }
        self.name = name
    }
}

class CartItem: Product {
    let quality: Int
    init?(name: String, quality: Int) {
        if quality < 1 {
            return nil
        }
        
        self.quality = quality
        super.init(name: name)
    }
}

//  通过传入一个非空字符串 name 以及一个值大于等于 1 的 quantity 来创建一个 CartItem 实例，那么构造方法能够成功被执行
if let twoSocks = CartItem(name: "sock", quality: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quality)")
}
//  以一个值为 0 的 quantity 来创建一个 CartItem 实例，那么将导致 CartItem 构造器失败
if let zeroShirts = CartItem(name: "shirt", quality: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quality)")
} else {
    print("Unable to initialize zero shirts with 0 quality")
}
//  传入一个值为空字符串的 name来创建一个 CartItem 实例，那么将导致父类 Product 的构造过程失败
if let oneUnnamed = CartItem(name: "", quality: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quality)")
} else {
    print("Unable to initialize one unnamed product")
}

//  定义一个结构体Checkerboard，它构建了西洋跳棋游戏的棋盘
struct Checkerboard {
    let colors: [Bool] = {
        var temp = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temp.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temp
    }()
    
    func squareIsBlack(row: Int, column: Int) -> Bool {
        return colors[8*row + column]
    }
    
    func desc() -> Void {
        print("colors is:")
        var start = 0
        var end = 7
        for i in 0...7 {
            print("\(colors[start...end])")
            start = end + 1;
            end = start + 7;
        }
    }
}

let checkerBoard = Checkerboard()
checkerBoard.desc()
print("checkerBoard[0][1] is \(checkerBoard.squareIsBlack(row: 0, column: 1))")
print("checkerBoard[7][7] is \(checkerBoard.squareIsBlack(row: 7, column: 7))")
