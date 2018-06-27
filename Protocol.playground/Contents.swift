//: Playground - noun: a place where people can play

import UIKit

/**===================================**/
/**协议和扩展**/
/**===================================**/

/**
 使用 protocol 来声明一个协议
 */
protocol ExampleProtocol {
    
    var simpleDescription : String { get }
    
    mutating func adjust()
    
}

/**
 类、枚举和结构体都可以实现协议
 */
class SimpleClass : ExampleProtocol {
    
    var simpleDescription: String = "A very simple class."
    
    var anotherProperty : Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
    
}
var simpleClass = SimpleClass()
simpleClass.adjust()
print("simpleClass -> ")
print("simpleDescription -> ")
print(simpleClass.simpleDescription)


struct SimpleStruct : ExampleProtocol {
    
    var simpleDescription: String = "A simple Structure."
    
    //mutating 关键字用来标记一个会修改结构体的方法
    mutating func adjust() {
        simpleDescription += " (struct adjused)"
    }
    
}
var simpleStruct = SimpleStruct()
simpleStruct.adjust()
print(simpleStruct.simpleDescription)


/**
 使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型
 */
extension Int : ExampleProtocol {
    
    var simpleDescription : String {
        return "The number is \(self)"
    }
    
    mutating func adjust() {
        self += 40
    }
    
}
var simpleInt = 5
simpleInt.adjust()
print(simpleInt)


/**
 给 Double 类型写一个扩展，添加 absoluteValue 功能
 */
extension Double {
    
    var simpleDescription : String {
        return "The number is \(self)"
    }
    
    mutating func absoluteValue() {
        if self < 0 {
            self = -1 * self
        }
    }
    
}
var simpleDouble = -10.0
simpleDouble.absoluteValue()
print(simpleDouble)

@objc protocol ProtocolTest {
    @objc optional func showMessage()
}
