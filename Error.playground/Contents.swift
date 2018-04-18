//: Playground - noun: a place where people can play

import UIKit

/**===================================**/
/**错误处理**/
/**===================================**/

/**
 使用采用 Error 协议的类型来表示错误
 */
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

/**
 使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码会进行错误处理
 */
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    else if printerName == "Never Has Paper" {
        throw PrinterError.outOfPaper
    }
    else if printerName == "Fire" {
        throw PrinterError.onFire
    }
    
    return "Job sent"
}


/**
 有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error
 */
var toPrinter = "Bi Sheng"
func printError() {
    do {
        let printerResponse = try send(job: 1040, toPrinter: toPrinter)
        print(printerResponse)
    } catch {
        print(error)
    }
}
printError()

toPrinter = "Never Has Toner"
printError()

/**
 可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch
 */
toPrinter = "Fire"//"Never Has Paper"
do {
    let printerResponse = try send(job: 1440, toPrinter: toPrinter)
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


/**
 另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil。否则的话，结果会是一个包含函数返回值的可选值
 */
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


/**
 使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用 defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同
 */
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
