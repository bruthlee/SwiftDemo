//
//  ArithmeticController.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/7/11.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import Foundation
import UIKit

private class ArithmeticSubject: NSObject {
    var title: String
    var detail: String
    var action: String
    init(title: String, detail: String, action: String) {
        self.title = title
        self.detail = detail
        self.action = action
    }
}

class ArithmeticController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    //  arithmetic func
    @objc private func twoNumSum() {
        print("=============================")
        print("two number sum.")
        let nums = [2, 7, 11, 15]
        let target = 13
        
        //method 1
        print("暴力方法，空间复杂度O(1), ")
        let numsCount = nums.count
        for i in 0..<numsCount-1 {
            for j in (i+1)...numsCount-1 {
                if nums[i] + nums[j] == target {
                    print("[\(i)]\(nums[i]) + [\(j)]\(nums[j]) = \(target)")
                    break
                }
            }
        }
        
        //method 2
        var map = [Int:Int]()
        for index in 0..<numsCount {
            map[nums[index]] = index
        }
        
    }
    
    //  table view
    var dataSource: NSMutableArray {
        let array = NSMutableArray()
        let sum = ArithmeticSubject.init(title: "两数之和", detail: "给定一个整数数组和一个目标值，找出数组中和为目标值的两个数", action: "twoNumSum")
        array.add(sum)
        return array
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "arithmeticLeetcodeCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "arithmeticLeetcodeCell")
            cell?.detailTextLabel?.numberOfLines = 0
        }
        let section = indexPath.section
        if section < dataSource.count {
            let subject: ArithmeticSubject = dataSource[section] as! ArithmeticSubject
            cell?.textLabel?.text = subject.title
            cell?.detailTextLabel?.text = subject.detail
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        if section < dataSource.count {
            let subject: ArithmeticSubject = dataSource[section] as! ArithmeticSubject
            let action = Selector.init(subject.action)
            self.perform(action)
        }
    }
    
}
