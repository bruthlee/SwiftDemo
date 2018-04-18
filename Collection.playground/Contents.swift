//: Playground - noun: a place where people can play

import UIKit

/**
 集合类型
     • 集合的可变性
     • 数组
     • 集合
     • 集合操作
     • 字典
 
 Swift 语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。数组（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集
 */

// 一. 数组
//  创建一个空数组
let empty1 = [Int]()
print("someInts is of type [Int] with \(empty1.count) items.")
var empty2 = [Int]()
print("someInts is of type [Int] with \(empty2.count) items.")
empty2.append(1);
empty2.append(contentsOf: [1, 2, 3])
print(empty2, " , length is \(empty2.count)")
empty2 = []
print(empty2, " , length is \(empty2.count)")

//  创建一个带有默认值的数组
let defaultArray1 = Array(repeating: 0.12, count: 3)
print(defaultArray1, ", length is \(defaultArray1.count)")

let defaultArray2 = [1, 2, 3, 5]
print(defaultArray2, ", length is \(defaultArray2.count)")

let defaultArray3 = Array(repeating: 0.25, count: 5)
print(defaultArray3, ", length is \(defaultArray3.count)")

//  通过两个数组相加创建一个数组
let defaultArray4 = defaultArray1 + defaultArray3
print(defaultArray4, ", length is \(defaultArray4.count)")

//  用数组字面量构造数组
let defaultArray5 : [String] = ["a", "b", "c"]
print(defaultArray5, ", length is \(defaultArray5.count)")

//  添加删除
var fruits = ["apple", "banana", "pear", "plum"]
print(fruits, ", length is \(fruits.count)")
fruits.append("eggs")
print(fruits, ", length is \(fruits.count)")
var removed = fruits.removeLast()
print(fruits, ", length is \(fruits.count)")
removed = fruits.removeFirst()
print(fruits, ", length is \(fruits.count)")
fruits.insert("apple", at: 0)
print(fruits, ", length is \(fruits.count)")
fruits.insert(contentsOf: ["fruit1", "fruit2"], at: 0)
print(fruits, ", length is \(fruits.count)")
fruits.removeSubrange(0..<2)
print(fruits, ", length is \(fruits.count)")

//  数组的遍历
for item in fruits {
    print(item)
}
//  如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组
for (index, name) in fruits.enumerated() {
    print("\(index) is \(name)")
}
print("=========================================")

// 二.集合（Sets）
//  创建和构造一个空的集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")
letters = []
print("letters is of type Set<Character> with \(letters.count) items.")
//letters.insert(1)//类型还是Character，会报错

//  用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//  简化写法: var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print("\(favoriteGenres) has \(favoriteGenres.count) elements.")
favoriteGenres.insert("Rock")
print("\(favoriteGenres) has \(favoriteGenres.count) elements.")
//  isEmpty空判断
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
//  insert元素
favoriteGenres.insert("City")
favoriteGenres.insert("Jazz")
print("\(favoriteGenres) has \(favoriteGenres.count) elements.")
//  remove元素
if let removedGenre = favoriteGenres.remove("City") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
print("\(favoriteGenres) has \(favoriteGenres.count) elements.")
//  contains是否包含指定元素
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
//  遍历一个集合
for name in favoriteGenres {
    print(name)
}
//  为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定
let favoriteSorted = favoriteGenres.sorted()
print("favoriteSored is \(favoriteSorted), has \(favoriteSorted.count) elements.")

//  集合操作
//      你可以高效地完成Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交
//          使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
//          使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
//          使用union(_:)方法根据两个集合的值创建一个新的集合。
//          使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合
let setA: Set = [1, 2, 3, 4, 5, 8]
print("setA is \(setA.sorted())")
let setB: Set = [2, 3, 5, 6, 7, 9]
print("setB is \(setB.sorted())")
let intersection = setA.intersection(setB)  //交集
print("intersection is \(intersection.sorted())")
let union = setA.union(setB)                //并集
print("union is \(union.sorted())")
let subtractingA = setA.subtracting(setB)   //A中B没有的
print("subtractionA is \(subtractingA.sorted())")
let subtractingB = setB.subtracting(setA)   //B中A没有的
print("subtractingB is \(subtractingB.sorted())")
let subDiff = setA.symmetricDifference(setB)//非交集
print("symmetricDifference is \(subDiff.sorted())")

//      集合成员关系和相等
//          使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
//          使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
//          使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
//          使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
//          使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)
let setC: Set = [1, 2, 3]
let setD: Set = [1, 2, 3]
let setE: Set = [3, 4, 5]
print("setC is \(setC.sorted())")
print("setD is \(setD.sorted())")
print("setE is \(setE.sorted())")
var comResult = setC.isSubset(of: setD)
print("setC.isSubset(of: setD) -> \(comResult)")
comResult = setD.isSubset(of: setC)
print("setD.isSubset(of: setC) -> \(comResult)")
comResult = setC.isSuperset(of: setD)
print("setC.isSuperset(of: setD) -> \(comResult)")
comResult = setD.isSuperset(of: setC)
print("setD.isSuperset(of: setC) -> \(comResult)")
comResult = setC.isStrictSuperset(of: setD)
print("setC.isStrictSuperset(of: setD) -> \(comResult)")
print("=================================")

// 三.字典
//  创建一个空字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[5] = "five"
print("namesOfIntegers is \(namesOfIntegers)")
print("namesOfIntegers[5] is \(namesOfIntegers[5])")
namesOfIntegers = [:]
print("namesOfIntegers is \(namesOfIntegers)")
var integerDic = [Int: Int]()
integerDic[1] = 10
integerDic[2] = 20
print("integerDic is \(integerDic)")
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("airports is \(airports)")
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
print("airports is \(airports)")
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary has \(airports.count) elements, is not empty.")
}
let oldValue = airports.updateValue("London123", forKey: "LHR")
print("oldValue is \(oldValue)")
print("airports is \(airports)")
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
//  字典遍历
for (key, value) in airports {
    print("[\(key)] = \(value)")
}
for key in airports.keys {
    print("Airport code: \(key)")
}
for value in airports.values {
    print("Airport name: \(value)")
}
