//: Playground - noun: a place where people can play

import UIKit

/*
 *  可选链式调用
       可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。
       多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
 
    注意
        Swift 的可选链式调用和 Objective-C 中向nil发送消息有些相像，但是 Swift 的可选链式调用可以应用于任意类型，并且能检查调用是否成功
 */
class Residence {
    var numberOfRooms = 1
}
class Person {
    var residence: Residence?
}
let john = Person()
if let rooms = john.residence?.numberOfRooms {
    print("john's numberOfRooms is \(rooms)")
}
else {
    print("Unable to retrieve the number of rooms.")
}
john.residence = Residence()
if let rooms = john.residence?.numberOfRooms {
    print("john's numberOfRooms is \(rooms)")
}
else {
    print("Unable to retrieve the number of rooms.")
}


/**
 为可选链式调用定义模型类
    通过使用可选链式调用可以调用多层属性、方法和下标。这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法或下标
 */
class People {
    var house: House?
    
}

class House {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    var address: Address?
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }
        else if street != nil, buildingNumber != nil {
            return "\(String(describing: buildingNumber))\(street ?? "")"
        }
        else {
            return nil
        }
    }
}
let bruthlee = People()
if let number = bruthlee.house?.numberOfRooms {
    print("bruthlee's house has \(number) rooms.")
}
else {
    print("Unable to query rooms of bruthlee's house.")
}
bruthlee.house = House()
if let number = bruthlee.house?.numberOfRooms {
    print("bruthlee's house has \(number) rooms.")
}
else {
    print("Unable to query rooms of bruthlee's house.")
}
let address = Address()
address.buildingNumber = "10"
address.buildingName = "创维大厦C座"
bruthlee.house?.address = address
if let adr = bruthlee.house?.address?.buildingIdentifier() {
    print("bruthlee's house address is \(adr).")
}
else {
    print("bruthlee's house address is validate.")
}
