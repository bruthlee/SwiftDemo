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
print("==========================")

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
    deinit {
        print("Country \(name) is being deinitialized.")
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
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
print("==========================")

/**
 *  闭包引起的循环强引用
        Swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表（closure capture list）
 */
class HTMLElement {
    let name: String
    let text: String?
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized with text: \(text).")
    }
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }
        else {
            return "<\(self.name) />"
        }
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
var html: String? = paragraph!.asHTML()
print(html)
paragraph = nil
print(paragraph)
print(html)
html = nil
print(html)
print("paragraph = nil, html = nil, 但是闭包的强引用导致HTMLElement析构函数没有执行，没有真正销毁实例")
print("==========================")

/**
 *  解决闭包引起的循环强引用
        在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声
        明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用
 */

/**
 *  定义捕获列表
 捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用（例如self）或初始化过的变量（如delegate = self.delegate!）。这些项在方括号中用逗号分开。
 
 如果闭包有参数列表和返回类型，把捕获列表放在它们前面：
 lazy var someClosure: (Int, String) -> String = {
     [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
     // 这里是闭包的函数体
 }
 
 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方：
 
 lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // 这里是闭包的函数体
 }
 */

/**
 *  在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
        相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。这使我们可以在闭包体内检查它们是否存在。
 
 注意
    如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用
 */
class HTMLOtherElement {
    let name: String
    let text: String?
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) ------ is being deinitialized.")
    }
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }
        else {
            return "<\(self.name) />"
        }
    }
}
var otherParagraph: HTMLOtherElement? = HTMLOtherElement(name: "p", text: "hello, world")
print(otherParagraph!.asHTML())
otherParagraph = nil //通过无主引用解决闭包强引用
