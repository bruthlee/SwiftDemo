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

repeatItem(repeating: "knock", numberOfTimes: 4)


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
anyCommonElements([1, 2, 3], [4])

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
containElements([1,2,3,4], [2,5])
