//
//  DiceGame.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/6/17.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation

protocol DiceGame {
    
    var dice: Dice { get }
    
    func play()
    
}

protocol DiceGameDelegate {
    
    func gameDidStart(_ game: DiceGame)
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    
    func gameDidEnd(_ game: DiceGame)
    
}
