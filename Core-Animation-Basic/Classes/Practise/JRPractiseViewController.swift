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
		tableView.dataList = ["Layer Sample",
		                      "Providing a Layer’s Contents",
		                      "Three",
		                      "Four"]
		view.addSubview(tableView)
		
		weak var weakSelf = self
		
		tableView.didSelectionAction = { (tableView, indexPath) -> () in
			weakSelf?.tableViewDidSelected(tableView: tableView, indexPath: indexPath)
		}
	}
	
	///
	func tableViewDidSelected(tableView: UITableView, indexPath: IndexPath) {
		
		var vc: JRBaseViewController?;
		
		switch indexPath.row {
		case 0:
			vc = JRLayerViewController()
			
		case 1:
			vc = LayerContentViewController()
			
		default: break
		}
		
		guard
			let viewController = vc
		else {
			return
		}

		viewController.hidesBottomBarWhenPushed = true
		navigationController?.pushViewController(viewController, animated: true)
	}

}
