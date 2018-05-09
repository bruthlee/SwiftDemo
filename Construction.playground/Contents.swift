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
