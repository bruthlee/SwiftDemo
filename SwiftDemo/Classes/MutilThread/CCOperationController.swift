//
//  CCOperationController.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/4/13.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import UIKit

class CCOperationController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textView: UITextView!
    
    lazy var dataSource : NSMutableArray = {
        var array = NSMutableArray()
        
        let blockMain = CCDemoRow.init(title: "Main Thread", action: "runMainBlock")
        let blockOther = CCDemoRow.init(title: "Other Thread", action: "runOtherThreadBlock")
        let blockSection = CCDemoSection.init(title: "Block Operation", datas: [blockMain, blockOther])
        array.add(blockSection)
        
        return array
    }()
    
    @objc func runMainBlock() {
        let block: BlockOperation = BlockOperation.init {
            print("执行runMainBlock: \(Date.init()), \(Thread.current)")
            sleep(2)
            print("执行runMainBlock: \(Date.init()), \(Thread.current)")
        }
        block.start()
    }
    
    @objc func runOtherThreadBlock() {
        DispatchQueue.global().async {
            let block: BlockOperation = BlockOperation.init {
                print("执行runOtherThreadBlock: \(Date.init()), \(Thread.current)")
                sleep(2)
                print("执行runOtherThreadBlock: \(Date.init()), \(Thread.current)")
            }
            block.start()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let demo : CCDemoSection = self.dataSource[section] as! CCDemoSection
        return demo.datas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ccOperationTableCell")!
        let section = indexPath.section
        if section < self.dataSource.count {
            let demo: CCDemoSection = self.dataSource[section] as! CCDemoSection
            let row = indexPath.row
            let item: CCDemoRow = demo.datas![row] as! CCDemoRow
            cell.textLabel?.text = item.title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        if section < self.dataSource.count {
            let demo: CCDemoSection = self.dataSource[section] as! CCDemoSection
            let row = indexPath.row
            let item: CCDemoRow = demo.datas![row] as! CCDemoRow
            let selector = Selector(item.action!)
            self.perform(selector)
        }
    }
    
}
