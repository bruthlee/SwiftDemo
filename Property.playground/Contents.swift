//: Playground - noun: a place where people can play

import UIKit

/**
 属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分，而计算属性计算（不是存储）一个值。计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体
 */
struct FixIntRange {
    var start: Int
    let length: Int
}
var fixIntRange = FixIntRange(start: 1, length:3)
print("fixIntRange = \(fixIntRange)")

//修改start
fixIntRange.start = 5
/// length是常量，无法修改
//      fixIntRange.length = 5
print("fixIntRange = \(fixIntRange)")

/// 值属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let x = origin.x + (size.width / 2)
            let y = origin.y + (size.height / 2)
            return Point(x: x, y: y)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var rect = Rect(origin: Point(x: 20, y:20), size: Size(width: 100, height:100))
let instanceCenter = rect.center
print("instanceCenter1: \(instanceCenter)")
rect.center = Point(x: 300, y:300)
print("instanceCenter2: \(instanceCenter)")
print("instanceCenter3: \(rect.center)")
print("===========================")

/// 类型属性
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
print("===========================")

/// 音量控制DEMO
struct AudioChannel {
    static let thresholdLevel = 10  /// 类静态常量
    static var maxInputLevelForAllChannels = 0      /// 类静态变量
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
                /// 此处不会触发didSet再次执行？不会造成属性观察器被再次调用
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
/// 进行复制运算观察类常量变化
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
print("===========================")
