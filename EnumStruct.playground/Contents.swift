//: Playground - noun: a place where people can play

import UIKit

/**===================================**/
/**枚举和结构体**/
/**===================================**/

/**
 使用 enum 来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法
 */
enum Rank : Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .two:
                return "two"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceValue = ace.rawValue
let two = Rank.two
let twoValue = two.rawValue
print("two des: ", two.simpleDescription())
let king = Rank.king
let kingValue = king.rawValue
print("king des: ", king.simpleDescription())

/**
 使用 init?(rawValue:) 初始化构造器来创建一个带有原始值的枚举成员。如果存在与原始值相应的枚举成员就返回该枚举成员，否则就返回 nil
 */
if let convertedRank = Rank.init(rawValue: 3) {
    let threeDes = convertedRank.simpleDescription()
    print("three des: ", threeDes)
}


/**
 枚举的关联值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值
 
 给 Suit 添加一个 color() 方法，对 spades 和 clubs 返回 “black” ，对 hearts 和 diamonds 返回 “red”
 */
enum Suit : Int {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let heart = Suit.hearts
print("heart des: ", heart.simpleDescription(), ", color is ", heart.color())

/**
 可以为枚举成员设定关联值，关联值是在创建实例时决定的。这意味着不同的枚举成员的关联值都可以不同。你可以把关联值想象成枚举成员的寄存属性。例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息
 */
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}

/**
 使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用
 */
struct Card {
    var rank : Rank
    var suit : Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func purkList() -> [String] {
        var list = [String]()
        for i in 1...13 {
            let rankCard = Rank(rawValue: i)
            for j in 1...4 {
                let suitCard = Suit(rawValue: j)
                let card = Card(rank: rankCard!, suit: suitCard!)
                let des = card.simpleDescription()
                list.append(des)
                print("card: ",card.simpleDescription())
            }
        }
        return list
    }
}
let threeOfSpade = Card(rank: Rank.three, suit: Suit.spades)
print("threeOfSpade des: ", threeOfSpade.simpleDescription())

protocol EnumeratedValues {
    static var allValues : [Self] {
        get
    }
}

extension Suit : EnumeratedValues {
    static var allValues : [Suit] {
        return [.spades, .hearts, .diamonds, .clubs]
    }
}

extension Rank : EnumeratedValues {
    static var allValues : [Rank] {
        return [.ace, .two, .three, .four, .five, .six, .seven,
                .eight, .nine, .ten, .jack, .queen, .king]
    }
}

var cardList = [String]()
for suit in Suit.allValues {
    for rank in Rank.allValues {
        let cardDes = "\(suit) \(rank)"
        cardList.append(cardDes)
    }
}
let cardValues = cardList.joined(separator: ", ")
print(cardValues)

//  原始值的隐式赋值: 在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let earthsOrder = Planet.earth.rawValue
let possiblePlanet = Planet(rawValue: 7)
//      然而，并非所有Int值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。在上面的例子中，possiblePlanet是Planet?类型，或者说“可选的Planet”
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//  递归枚举
//      递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层
//      在枚举成员前加上indirect来表示该成员可递归
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
