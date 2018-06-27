//
//  SnakesAndLadders.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/6/17.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation

class SnakesAndLadders: DiceGame {
    
    let finalSquare = 25
    var dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    //var dice = Dice(sides: 6, generator: DiceRandom())
    var square = 0
    var board: [Int]
    
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    func updateGenerator(genetator: RandomNumberGenerator) {
        dice = Dice(sides: 6, generator: genetator)
    }
    
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
    
}
