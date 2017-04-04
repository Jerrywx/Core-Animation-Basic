//
//  JRDemoViewController.swift
//  Core-Animation-Basic
//
//  Created by 王潇 on 2017/4/4.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRDemoViewController: JRBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Demo"
		
		setupUI()
    }
}

// MARK: - 初始化UI
extension JRDemoViewController {
	
	func setupUI() {
		
		let tableView = JRTableView(frame: view.bounds, style: .plain)
		tableView.dataList = ["One", "Two", "Three", "Four"]
		view.addSubview(tableView)
		
		tableView.didSelectionAction = { (tableView, IndexPath) -> () in
			print("tableView:\(tableView)");
		}
	}
}
