//: Playground - noun: a place where people can play

import UIKit

/**
 *  下面的例子定义了一个名为LevelTracker结构体。它监测玩家的游戏发展情况（游戏的不同层次或阶段）。这是一个单人游戏，但也可以存储多个玩家在同一设备上的游戏信息
 */

struct LevelTracker {
    
    static var highLevel = 1
    
    var currentLevel = 1
    
    /// 解锁一关，更新highLevel
    static func unlock(_ level: Int) {
        if level > highLevel {
            highLevel = level
        }
    }
    
    /// 判断level是否解锁状态
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highLevel
    }
    
    @discardableResult  ///声明可以忽略返回值
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }
        else {
            return false
        }
    }
    
}

/// 下面，Player类使用LevelTracker来监测和更新每个玩家的发展进度
class Player {
    /// 进度
    var levelTracker = LevelTracker()
    /// 玩家名称
    let name: String
    
    func complete(level: Int) {
        /// 解锁level
        LevelTracker.unlock(level+1)
        /// 检查level
        levelTracker.advance(to: level+1)
        print("tracker level : \(levelTracker.currentLevel)")
    }
    
    init(name: String) {
        self.name = name
    }
    
}

/// 新建玩家测试
var player = Player(name: "Talyer")
print("palyer1: \(player.name), \(player.levelTracker.currentLevel)")
player.complete(level: 3)
print("palyer1: \(player.name), \(player.levelTracker.currentLevel)")

/// 创建了第二个玩家，并尝试让他开始一个没有被任何玩家解锁的等级，那么试图设置玩家当前等级
player = Player(name: "Bello")
print("palyer2: \(player.name), \(player.levelTracker.currentLevel)")
if player.levelTracker.advance(to: 10) {
    print("player is now on level 10")
}
else {
    print("level 10 has not yet been unlocked")
}


/**
 *  下标语法
 */
struct TimesTable {
    
    let mul: Int
    
    subscript(index: Int) -> Int {
        return mul * index
    }
    
}

/// 测试TimesTable
let timesTable = TimesTable(mul: 5)
print("timesTable is \(timesTable)")
