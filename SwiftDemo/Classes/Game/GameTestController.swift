//
//  GameTestController.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/6/17.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation

class GameTestController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Game"
    }
    
    @IBAction func touchSnakesAndLaddersTest(_ sender: Any) {
        let random = Int(arc4random_uniform(10) + 1)
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        if random % 2 == 0 {
            game.updateGenerator(genetator: DiceRandom())
            print("The game is using DiceRandom()")
        }
        else {
            print("The game is using LinearCongruentialGenerator()")
        }
        game.play()
    }
}
