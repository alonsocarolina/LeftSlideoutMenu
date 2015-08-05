//
//  LeftMenu.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class LeftMenu : UITableViewController {
    
    let menuOptions = ["Open Modal", "Open Push"]
    
}

// MARK: - UITableViewDelegate methods

extension LeftMenu {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            // ContainerVC.swift listens for this
            NSNotificationCenter.defaultCenter().postNotificationName("openModalWindow", object: nil)
        case 1:
            // Both FirstViewController and SecondViewController listen for this
            NSNotificationCenter.defaultCenter().postNotificationName("openPushWindow", object: nil)
        default:
            println("indexPath.row:: \(indexPath.row)")
        }
        
        // also close the menu
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
        
    }
    
}

// MARK: - UITableViewDataSource methods

extension LeftMenu {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }
    
}