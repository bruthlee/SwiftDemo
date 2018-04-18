//
//  CCFontController.swift
//  SwiftDemo
//
//  Created by hollywater on 2018/4/12.
//  Copyright © 2018年 CCVideo Co.,Ltd. All rights reserved. All rights reserved.
//

import UIKit

class CCFontController: UITableViewController {
    
    let dataSource = UIFont.familyNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let familyName = self.dataSource[section]
        return UIFont.fontNames(forFamilyName: familyName).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ccFontTableCell")
        let section = indexPath.section
        let row = indexPath.row
        let familyName = self.dataSource[section]
        let fonts = UIFont.fontNames(forFamilyName: familyName)
        let fontName = fonts[row]
        cell?.textLabel?.text = fontName
        cell?.textLabel?.font = UIFont.init(name: fontName, size: 16.0)
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataSource[section]
    }
    
}
