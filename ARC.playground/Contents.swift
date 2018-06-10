//: Playground - noun: a place where people can play

import UIKit

/**
 自动引用计数
 
 自动引用计数的工作机制
 自动引用计数实践
 类实例之间的循环强引用
 解决实例之间的循环强引用
 闭包引起的循环强引用
 解决闭包引起的循环强引用
 Swift 使用自动引用计数（ARC）机制来跟踪和管理你的应用程序的内存。通常情况下，Swift 内存管理机制会一直起作用，你无须自己来考虑内存的管理。ARC 会在类的实例不再被使用时，自动释放其占用的内存。
 
 然而在少数情况下，为了能帮助你管理内存，ARC 需要更多的，代码之间关系的信息。本章描述了这些情况，并且为你示范怎样才能使 ARC 来管理你的应用程序的所有内存。在 Swift 使用 ARC 与在 Obejctive-C 中使用 ARC 非常类似
 */

/**
 自动引用计数的工作机制
 */
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Appleseed") //1
reference2 = reference1  //2
reference3 = reference1  //3
reference1 = nil    //2
reference2 = nil    //1
reference3 = nil    //0
print("==========================")

/**
 *  解决实例之间的循环强引用
        Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）
 */

/**
 弱引用
    弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。
    这个特性阻止了引用变为循环强引用。
    声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用
 */
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Person?
var unit4A: Apartment?
john = Person(name: "Holly Water")
unit4A = Apartment(unit: "4A")
unit4A!.tenant = john
john = nil
unit4A = nil
print("==========================")

/**
 无主引用
    和弱引用类似，无主引用不会牢牢保持住引用的实例。
    和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。
    可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。
 */
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
var holly: Customer?
holly = Customer(name: "creditcard-customer")
holly!.card = CreditCard(number: 1234_5678_9012_3456, customer: holly!)
holly = nil

/**
 *  无主引用以及隐式解析可选属性
        存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性
 */
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
