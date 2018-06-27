//: Playground - noun: a place where people can play

import UIKit

/**===================================**/
/**泛型**/
/**===================================**/

/**
 在尖括号里写一个名字来创建一个泛型函数或者类型
 */
func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let repeatItems = repeatItem(repeating: "knock", numberOfTimes: 4)
print("repeatItems is \(repeatItems)")

/**
 也可以创建泛型函数、方法、类、枚举和结构体
 */
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
print("possibleInteger: ",possibleInteger)


/**
 在类型名后面使用 where 来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类
 */
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element : Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
let anyCommonResult = anyCommonElements([1, 2, 3], [4])
print("anyCommonResult = \(anyCommonResult)")

/**
 修改 anyCommonElements(_:_:) 函数来创建一个函数，返回一个数组，内容是两个序列的共有元素
 */
func containElements<T: Sequence, U: Sequence>(_ left: T, _ right: U) -> [Any]
    where T.Iterator.Element : Equatable, T.Iterator.Element == U.Iterator.Element {
    var result = [Any]()
    for leftItem in left {
        for rightItem in right {
            if leftItem == rightItem {
                result.append(leftItem)
            }
        }
    }
    return result
}
let containResult = containElements([1,2,3,4], [2,5])
print("containResult = \(containResult)")

/**
 *  交换两个相同类型的值
 */
func swapTwoValues<T>(_ value1: inout T, _ value2: inout T) {
    let temp = value2
    value2 = value1
    value1 = temp
}
var swapValue1 = "a"
var swapValue2 = "b"
swapTwoValues(&swapValue1, &swapValue2)
print("'a' & 'b' swap result is '\(swapValue1)' & '\(swapValue2)'")

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print("stackOfStrings is \(stackOfStrings)")
var fromTheTop = stackOfStrings.pop()
print("stackOfStrings is \(stackOfStrings), and \(fromTheTop) is poped.")
fromTheTop = stackOfStrings.pop()
print("stackOfStrings is \(stackOfStrings), and \(fromTheTop) is poped.")
fromTheTop = stackOfStrings.pop()
print("stackOfStrings is \(stackOfStrings), and \(fromTheTop) is poped.")
fromTheTop = stackOfStrings.pop()
print("stackOfStrings is \(stackOfStrings), and \(fromTheTop) is poped.")
print("============================")

/**
 扩展一个泛型类型
 */
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
stackOfStrings.push("uno")
stackOfStrings.push("dos")
print("stackOfStrings is \(stackOfStrings)")
if let topItem = stackOfStrings.topItem {
    print("stackOfStrings topItem is \(topItem)")
}
else {
    print("stackOfStrings topItem is nil")
}
