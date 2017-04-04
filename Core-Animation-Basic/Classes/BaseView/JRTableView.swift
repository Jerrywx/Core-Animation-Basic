//
//  JRTableView.swift
//  Core-Animation-Basic
//
//  Created by 王潇 on 2017/4/4.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRTableView: UITableView {

	/// 点击事件
	var didSelectionAction: ((UITableView, IndexPath) -> ())?

	/// 数据源
	var dataList:[String]? {
		
		willSet {
			print(newValue ?? "error")
		}
		
		didSet {
			self.reloadData()
		}
	}
	
	override init(frame: CGRect, style: UITableViewStyle) {
		super.init(frame: frame, style: style)
		delegate = self
		dataSource = self
		register(UITableViewCell.self, forCellReuseIdentifier: "normalCell")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension JRTableView: UITableViewDataSource, UITableViewDelegate {
	@available(iOS 2.0, *)
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataList?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell")
		
		cell?.textLabel?.text = dataList?[indexPath.row]
		
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		if (didSelectionAction != nil) {
			didSelectionAction!(tableView, indexPath)
		} 
	}
}
