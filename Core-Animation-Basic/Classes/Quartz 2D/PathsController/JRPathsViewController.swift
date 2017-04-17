//
//  JRPathsViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRPathsViewController: JRBaseViewController {

	///
	var creatView: CreatPaths?
	var arcView: JRArcView?
	///
	var scrollView: UIScrollView?
	var tableView = UITableView()
	///
	var titleArray: [String]?
	var viewList: [Array<Any>]?
	
	let width = UIScreen.main.bounds.size.width - 40
	
    override func viewDidLoad() {
        super.viewDidLoad()

		initData()
		
		setupUI()
    }
}

// MARK: - UI
extension JRPathsViewController {
	
	func setupUI() {
		
		title = "Paths"
		
		tableView.frame		 = view.bounds
		tableView.register(JRTableViewCell.self, forCellReuseIdentifier: "paths")
		tableView.rowHeight  = 200
		tableView.delegate	 = self
		tableView.dataSource = self
		tableView.separatorInset = UIEdgeInsets.zero
		view.addSubview(tableView)
		
	}
	
	func initData() {
		
		/// 头部标题
		titleArray = ["构建块",
		              "创建路径",
		              "绘制路径",
		              "裁剪路径"];
		
		/// view
		viewList = [[CreateLineView()],
		            [BlendModesView()],
		            [UIView()],
		            [UIView()],];
	}
	
	func pathDemo() {
		creatView = CreatPaths(frame: CGRect(x: 20, y: 20, width: width, height: 140))
		creatView?.backgroundColor	 = UIColor.white
		creatView?.layer.borderColor = UIColor.black.cgColor
		creatView?.layer.borderWidth = 1
		view.addSubview(creatView!)
		
		arcView = JRArcView(frame: CGRect(x: 20, y: (creatView?.frame.maxY)! + 20, width: width, height: 140))
		arcView?.backgroundColor	 = UIColor.white
		arcView?.layer.borderColor = UIColor.black.cgColor
		arcView?.layer.borderWidth = 1
		view.addSubview(arcView!)
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension JRPathsViewController: UITableViewDataSource, UITableViewDelegate {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return titleArray?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		guard let views = viewList else {
			return 0
		}
		
		return (views[section] as AnyObject).count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "paths") as! JRTableViewCell
		
		guard let views = viewList else {
			return cell
		}

		let array = views[indexPath.section]
		cell.addNewView(view: array[indexPath.row] as! UIView)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard let array = titleArray else {
			return ""
		}
		
		return array[section]
	}
}



