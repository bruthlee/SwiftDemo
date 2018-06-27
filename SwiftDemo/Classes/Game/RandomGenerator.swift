//
//  RandomGenerator.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/6/17.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation

protocol RandomNumberGenerator {
    
    func random() -> Double
    
}

class DiceRandom: RandomNumberGenerator {
    
    func random() -> Double {
        let random = Double(arc4random_uniform(10) + 1) / 10.0
        return random
    }
    
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
}
