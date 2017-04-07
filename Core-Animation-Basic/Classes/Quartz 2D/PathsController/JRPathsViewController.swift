//
//  JRPathsViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRPathsViewController: JRBaseViewController {

	var creatView: CreatPaths?
	var arcView: JRArcView?
	let width = UIScreen.main.bounds.size.width - 40
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupUI()
    }
}

// MARK: - UI
extension JRPathsViewController {
	
	func setupUI() {
		
		title = "Paths"
		
		creatView = CreatPaths(frame: CGRect(x: 20, y: 80, width: width, height: 140))
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
