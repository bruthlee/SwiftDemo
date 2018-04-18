//: Playground - noun: a place where people can play

import UIKit

/**
 字符串和字符（Strings and Characters）
 在 Swift 中，字符串和字符并不区分地域(not locale-sensitive)
 */

// 多行字符串字面量 开始结束符"""
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
print("=========================")

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)
print("=========================")

// 一个多行字符串字面量能够缩进来匹配周围的代码。关闭引号(""")之前的空白字符串告诉Swift编译器其他各行多少空白字符串需要忽略。然而，如果你在某行的前面写的空白字符串超出了关闭引号(""")之前的空白字符串，则超出部分将被包含在多行字符串字面量中
let lineBreaks = """
    This string starts with a line break.
    It also ends with a line break.
"""
print(lineBreaks)
print("=========================")

// 字符串字面量的特殊字符
// 转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
// Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
print(dollarSign, " - ", blackHeart, " - ", sparklingHeart)

// 由于多行字符串字面量使用了三个双引号，而不是一个，所以你可以在多行字符串字面量里直接使用双引号（"）而不必加上转义符（\）。要在多行字符串字面量中使用 """ 的话，就需要使用至少一个转义符（\）
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)
print("=========================")

// 初始化空字符串
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串是值类型
// Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作
let valueString = "string1717"
func printMyString(str: String) -> Void {
    print(str)
    var otherString = str;
    otherString += " to other"
    print(otherString)
}
printMyString(str: valueString)
for character in "Dog!🐶" {
    print(character)
}
print("=========================")

// 连接字符串和字符
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
print(badStart + "\n" + end)
let goodStart = """
one
two

"""
print(goodStart + end)
print("=========================")

// 字符串插值
// 字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。字符串字面量和多行字符串字面量都可以使用字符串插值
// 插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

// 可扩展的字形群集
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
// 可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值。 例如，来自朝鲜语字母表的韩语音节能表示为组合或分解的有序排列.
// 在 Swift 都会表示为同一个单一的Character值
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ 是 한, decomposed 是 한
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print("=========================")
// 地域性指示符号的 Unicode 标量可以组合成一个单一的Character值
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// 计算字符数量
// 可扩展的字符群集可以组成一个或者多个 Unicode 标量。这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。所以 Swift 中的字符在一个字符串中并不一定占用相同的内存空间数量。因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。如果您正在处理一个长字符串，需要注意count属性必须遍历全部的 Unicode 标量，来确定字符串的字符数量。
// 另外需要注意的是通过count属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters") //40
// 在 Swift 中，使用可拓展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"    // 拼接一个重音, U+0301
print("the number of characters in \(word) is \(word.count)")
print("=========================")

/**
 访问和修改字符串
 */
// 不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。
// 使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
// 通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用 index(before:) 或 index(after:) 方法
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

// 使用 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符
for index in greeting.indices {
    print("\(greeting[index])")
}

//插入和删除
// 调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
print(welcome)
// 调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
print(range)
welcome.removeSubrange(range)
print(welcome)

//子字符串
// 从字符串中获取一个子字符串 —— 例如，使用下标或者 prefix(_:) 之类的方法 —— 就可以得到一个 SubString 的实例，而非另外一个 String
let greet = "Hello world"
let spaceIndex = greet.index(of: " ") ?? greet.endIndex
let subGreet = greet[..<spaceIndex]
print(subGreet, " type is ", type(of: subGreet))
let convertStr = String(subGreet)
print(convertStr)
print("=========================")

// 字符串/字符相等
let quotation1 = "We're a lot alike, you and I."
let sameQuotation1 = "We're a lot alike, you and I."
if quotation1 == sameQuotation1 {
    print("These two strings are considered equal")
}
// 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的。在这个情况下，即使可扩展的字形群集是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标准相等
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// 相反，英语中的LATIN CAPITAL LETTER A(U+0041，或者A)不等于俄语中的CYRILLIC CAPITAL LETTER A(U+0410，或者A)。两个字符看着是一样的，但却有不同的语言意义
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
print("==============================")

// 前缀/后缀
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("romeoAndJuliet has \(act1SceneCount) scence.")
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("romeoAndJuliet has \(mansionCount) address is Capulet's mansion, and \(cellCount) address is Friar Lawrence's cell.")
print("==============================")

//字符串的 Unicode 表示形式
/*
 当一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 Unicode 标量会用 Unicode 定义的几种编码格式（encoding forms）编码。每一个字符串中的小块编码都被称代码单元（code units）。这些包括 UTF-8 编码格式（编码字符串为8位的代码单元）， UTF-16 编码格式（编码字符串位16位的代码单元），以及 UTF-32 编码格式（编码字符串32位的代码单元）。
 
 Swift 提供了几种不同的方式来访问字符串的 Unicode 表示形式。 您可以利用for-in来对字符串进行遍历，从而以 Unicode 可扩展的字符群集的方式访问每一个Character值。 该过程在 使用字符 中进行了描述。
 
 另外，能够以其他三种 Unicode 兼容的方式访问字符串的值：
 
 UTF-8 代码单元集合 (利用字符串的utf8属性进行访问)
 UTF-16 代码单元集合 (利用字符串的utf16属性进行访问)
 21位的 Unicode 标量值集合，也就是字符串的 UTF-32 编码格式 (利用字符串的unicodeScalars属性进行访问)
 */
let dogString = "Dog‼🐶"
// UTF-8 表示
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("---")
// UTF-16 表示
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("---")
// Unicode 标量表示
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("---")

// 作为查询它们的value属性的一种替代方法，每个UnicodeScalar值也可以用来构建一个新的String值，比如在字符串插值中使用
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
