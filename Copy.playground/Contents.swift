//: Playground - noun: a place where people can play

import UIKit

/**
 swift数据类型值拷贝
 */

/// Int拷贝
var int1 = 10
var int2 = int1
int2 = 99
print("int1 = \(int1), int2 = \(int2)")

/// Float拷贝
var float1 : Float = 0.1
var float2 = float1
float1 = 0.2
print("float1 = \(float1), float2 = \(float2)")

/// Double拷贝
var double1 : Double = 0.1314
var double2 = double1
double2 = 3.1415926
print("double1 = \(double1), double2 = \(double2)")

/// Boolean拷贝
var boolean1 : Bool = true
var boolean2 = boolean1
boolean1 = false
print("boolean1 = \(boolean1), boolean2 = \(boolean2)")

/// String拷贝
var string1 = "China"
var string2 = string1
string2 = "Chinese"
print("string1 = \(string1), string2 = \(string2)")

/// 数组拷贝
var array1 = [1,2,3,4,5]
var array2 = array1, array3 = array1
array2[1] = 10
array3.append(99)
print("[array1->1] = \(array1[1]), [array2->1] = \(array2[1])")
print("[array1] = \(array1), [array2] = \(array2), [array3] = \(array3)")

/// 字典拷贝
var dic1 = ["key1":"value1", "key2":"value2"]
var dic2 = dic1
dic1["key1"] = "value111"
print("dic1[key1] = \(String(describing: dic1["key1"])), dic2[key1] = \(String(describing: dic2["key1"]))")

/// 结构体拷贝
struct Rectange {
    var width = 0
    var height = 0
}
var rectange1 = Rectange(width: 10, height:20)
var rectange2 = rectange1
rectange2.width = 100
rectange2.height = 200
print("[rectange1] = \(rectange1), [rectange2] = \(rectange2)")

/// 引用类型不做拷贝,指向同一个地址
class Shape {
    var rectange = Rectange()
    var length = 0
}
let shape1 = Shape()
shape1.rectange = rectange1
shape1.length = 10
let shape2 = shape1
shape2.length = 20
shape2.rectange = rectange2
print("[shape1] \(shape1.rectange), \(shape1.length)")
print("[shape2] \(shape2.rectange), \(shape2.length)")

if shape1 === shape2 {
    print("shape1 and shape2 refer to the same Shape instance & address.")
}
