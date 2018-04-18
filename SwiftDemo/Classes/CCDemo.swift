//
//  CCDemo.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/4/13.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation

class CCDemoSection: NSObject {
    
    var title: String?
    
    var datas: Array<Any>?
    
    init(title: String, datas: Array<Any>) {
        self.title = title
        self.datas = datas
    }
    
}


class CCDemoRow: NSObject {
    
    var title: String?
    
    var action: String?
    
    init(title: String, action: String) {
        self.title = title
        self.action = action
    }
    
}
