//: Playground - noun: a place where people can play

import UIKit

/**
 *  一个类可以继承另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。在 Swift 中，继承是区分「类」与其它类型的一个基本特征
 */

/// 不继承于其它类的类，称之为基类
class Vehicle {
    var currentSpeed = 0.0
    var description : String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}
/// 测试基类
let vehicle = Vehicle()
print("vehicle: \(vehicle.description)")

/// 定义一个叫Bicycle的子类，继承成父类Vehicle
class Bicycle: Vehicle {
    var hasBasket = false
    override var description: String {
        return super.description + " and hasBasket is \(hasBasket)"
    }
    
}
/// Bicycle测试
let bicycle = Bicycle()
bicycle.hasBasket = true
print("bicycle: \(bicycle.description)")
bicycle.currentSpeed = 15.0
print("bicycle: \(bicycle.description)")

/// 为Bicycle创建了一个名为Tandem（双人自行车）的子类
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    override var description: String {
        return super.description + " and currentNumberOfPassengers is \(currentNumberOfPassengers)"
    }
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

/// 重写属性观察器
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
/**
 *  定义了一个新类叫AutomaticCar，它是Car的子类。AutomaticCar表示自动挡汽车，它可以根据当前的速度自动选择合适的挡位
 */
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}
let autoCar = AutomaticCar()
autoCar.currentSpeed = 34.0
print("AutoCar: \(autoCar.description)")

/// 防止重写
/**
 *  可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）
 */
