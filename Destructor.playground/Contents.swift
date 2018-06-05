//: Playground - noun: a place where people can play

import UIKit

/**
 析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit来标示，类似于构造器要用init来标示。
 
 析构过程原理
 Swift 会自动释放不再需要的实例以释放资源。如自动引用计数章节中所讲述，Swift 通过自动引用计数（ARC）处理实例的内存管理。通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前手动去关闭该文件。
 
 在类的定义中，每个类最多只能有一个析构器，而且析构器不带任何参数
 */

//  析构器实践
//      Bank类管理一种虚拟硬币，确保流通的硬币数量永远不可能超过 10,000。在游戏中有且只能有一个Bank存在，因此Bank用类来实现，并使用类型属性和类型方法来存储和管理其当前状态
class Bank {
    static var coins = 10_1000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let num = min(coins, numberOfCoinsRequested)
        coins -= num
        return num
    }
    
    static func receive(coins: Int) {
        self.coins += coins
    }
}

//      Player类描述了游戏中的一个玩家。每一个玩家在任意时间都有一定数量的硬币存储在他们的钱包中。这通过玩家的coinsInPurse属性来表示

