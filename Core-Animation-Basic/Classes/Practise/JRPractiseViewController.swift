//
//  JRPractiseViewController.swift
//  Core-Animation-Basic
//
//  Created by 王潇 on 2017/4/4.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRPractiseViewController: JRBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Pract"
		
		setupUI()
	}
}

// MARK: - 初始化UI
extension JRPractiseViewController {
	
	func setupUI() {
		
		let tableView = JRTableView(frame: view.bounds, style: .plain)
		tableView.dataList = ["One", "Two", "Three", "Four"]
		view.addSubview(tableView)
		
		weak var weakSelf = self
		
		tableView.didSelectionAction = { (tableView, indexPath) -> () in
			weakSelf?.tableViewDidSelected(tableView: tableView, indexPath: indexPath)
		}
	}
	
	///
	func tableViewDidSelected(tableView: UITableView, indexPath: IndexPath) {
		
		print("didSelected Meyhond")
	}
	
}
