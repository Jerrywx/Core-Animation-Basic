//
//  JRTextViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRTextViewController: JRBaseViewController {

	var textView: JRTextView?
	let width = UIScreen.main.bounds.size.width - 40
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupUI()
    }
	
}

// MARK: - UI
extension JRTextViewController {
	
	func setupUI() {
		title = "Drawing Text"
		
		textView = JRTextView(frame: CGRect(x: 20, y: 80, width: width, height: width))
		textView?.backgroundColor = UIColor.yellow
		view.addSubview(textView!)
		
	}
	
}
