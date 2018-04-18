//: Playground - noun: a place where people can play

import UIKit

/**===================================**/
/**对象和类**/
/**===================================**/


/**
 使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样，唯一的区别就是它们的上下文是类。同样，方法和函数声明也一样
 */
class Shape {
    
    var sides = 0
    var name : String
    
    init() {
        self.name = "Circle"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A \(name) shape with \(sides) sides."
    }
    
    func changeColor(color: UIColor) -> Void {
        print("\(name) shape color is ", color)
    }
    
}

var shape = Shape()
shape.sides = 1
var shapeDes = shape.simpleDescription()
print("shape description: ", shapeDes)
shape.changeColor(color: .red)

shape = Shape.init(name: "Range")
shapeDes = shape.simpleDescription()
print("shape description: ", shapeDes)


/**
 子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以根据需要添加或者忽略父类。
 
 子类如果要重写父类的方法的话，需要用 override 标记——如果没有添加 override 就重写父类方法的话编译器会报错。编译器同样会检测 override 标记的方法是否确实在父类中
 */
class TriangleShape : Shape {
    
    var sideLength : Double = 0
    
    init(length: Double, name: String) {
        self.sideLength = length
        super.init(name: name)
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        //在 perimeter 的 setter 中，新值的名字是 newValue。
        //可以在 set 之后显式的设置一个名字
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An triangle with sides of length \(sideLength)."
    }
    
}

var triangle = TriangleShape.init(length: 5.0, name: "Demo")
shapeDes = triangle.simpleDescription()
print("shape description: ", shapeDes, ", perimeter is ", triangle.perimeter)
triangle.perimeter = 9.9
print("triangle length is ", triangle.sideLength)


/**
 处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ?。如果 ? 之前的值是 nil，? 后面的东西都会被忽略，并且整个表达式返回 nil。否则，? 之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值
 */
let optionShape : Shape? = Shape.init(name: "A Shape")
let optionShapeSides = optionShape?.sides
