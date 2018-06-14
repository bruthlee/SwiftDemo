//: Playground - noun: a place where people can play

import UIKit

/**
 类型转换
 
 定义一个类层次作为例子
 检查类型
 向下转型
 Any 和 AnyObject 的类型转换
 类型转换 可以判断实例的类型，也可以将实例看做是其父类或者子类的实例。
 
 类型转换在 Swift 中使用 is 和 as 操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型
 */
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
print("library is \n \(library)")
//  [__lldb_expr_123.Movie, __lldb_expr_123.Song, __lldb_expr_123.Movie, __lldb_expr_123.Song, __lldb_expr_123.Song]

print("library type is \(type(of: library))")
//  library type is Array<MediaItem>描述为父类class

/**
 *  检查类型
        用类型检查操作符（is）来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true，否则返回 false
 */
var movieCount = 0, songCount = 0
var movie = [Movie]()
var song = [Song]()
for item in library {
    if item is Movie {
        movieCount += 1
        movie.append(item as! Movie)
    }
    else if item is Song {
        songCount += 1
        song.append(item as! Song)
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")
//  Media library contains 2 movies and 3 songs
print("Library Movie is \n \(movie)")
//  [__lldb_expr_123.Movie, __lldb_expr_123.Movie]
print("Library Song is \n \(song)")
//  [__lldb_expr_123.Song, __lldb_expr_123.Song, __lldb_expr_123.Song]

/**
 *  向下转型
        某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类型，用类型转换操作符（as? 或 as!）。
        因为向下转型可能会失败，类型转型操作符带有两种不同形式。条件形式as? 返回一个你试图向下转成的类型的可选值。强制形式 as! 把试图向下转型和强制解包转换结果结合为一个操作。
        当你不确定向下转型可以成功时，用类型转换的条件形式（as?）。条件形式的类型转换总是返回一个可选值，并且若下转是不可能的，可选值将是 nil。这使你能够检查向下转型是否成功。
        只有你可以确定向下转型一定会成功时，才使用强制形式（as!）。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误
 */
for item in library {
    if let movie = item as? Movie {
        print("movie is ==\(movie.name)== by ==\(movie.director)==")
    }
    else if let song = item as? Song {
        print("song is ==\(song.name)== by ==\(song.artist)==")
    }
}
print("=======================================================")
print("=======================================================")

/**
 *  Any 和 AnyObject 的类型转换
        Swift 为不确定类型提供了两种特殊的类型别名：
 
        Any 可以表示任何类型，包括函数类型。
        AnyObject 可以表示任何类类型的实例。
        只有当确实需要它们的行为和功能时才使用 Any 和 AnyObject。在代码里使用期望的明确类型总是更好的
 */
var anything = [Any]()
anything.append(0)
anything.append(0.0)
anything.append(1)
anything.append(0.1)
anything.append(0xf)
anything.append(-1)
anything.append(0xff)
anything.append("abc")
anything.append(0xeee)
anything.append(0xfff)
anything.append((1,2))
anything.append(Movie(name: "Star", director: "Big Guy"))
anything.append({ (name: String) -> String in "Hello, \(name)" })
print("anything is \n \(anything)")
//  [1, 0.10000000000000001, -1, "abc", 4095, (1, 2), __lldb_expr_236.Movie, (Function)]
for item in anything {
    print("\(item) type is \(type(of: item))")
}
print("(0xeee)14 * 16^2 + 14 * 16 + 14 = \(14*16*16 + 14*16 + 14)")
print("(0xfff)15 * 16^2 + 15 * 16 + 15 = \(15*16*16 + 15*16 + 15)")
print("============================================================")

/**
 利用switch 表达式的 case 中使用 is 和 as 操作符来找出只知道是 Any 或 AnyObject 类型的常量或变量的具体类型
 */
for item in anything {
    switch item {
    case 0 as Int:
        print("\(item) is an Int.")
    case 0 as Double:
        print("\(item) is an Double.")
    case let someInt as Int:
        print("an integer value of \(someInt).")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("\(item) is some other double value that I don't want to print.")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Int, Int):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', by \(movie.director)")
    case let stringConvert as (String) -> String:
        print(stringConvert("Michael"))
    default:
        print("other thing.")
    }
}
