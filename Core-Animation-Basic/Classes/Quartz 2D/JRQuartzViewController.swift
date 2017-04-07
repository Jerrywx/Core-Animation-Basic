//
//  JRQuartzViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRQuartzViewController: JRBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Quartz"
		setupUI()
	}
}

// MARK: - 初始化UI
extension JRQuartzViewController {
	
	func setupUI() {
		
		let tableView = JRTableView(frame: view.bounds, style: .plain)
		tableView.dataList = ["Graphics Contexts", "Two", "Three", "Four"]
		view.addSubview(tableView)
		
		weak var weakSelf = self
		tableView.didSelectionAction = { (tableView, IndexPath) -> () in
			weakSelf?.tableViewDidSelected(tableView: tableView, indexPath: IndexPath)
		}
	}

	/// tableView 点击
	///
	/// - Parameters:
	///   - tableView: tableView
	///   - indexPath: indexPath
	func tableViewDidSelected(tableView: UITableView, indexPath: IndexPath) {
		print("======++")
		
		switch indexPath.row {
			case 0:
				let vc = JRContextsViewController()
				navigationController?.pushViewController(vc, animated: true)
			default:
				break
		}
	}
	
}
