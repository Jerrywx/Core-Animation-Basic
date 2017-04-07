//
//  NormalView.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class NormalView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		
		/// 获取上下文
		let myContext = UIGraphicsGetCurrentContext()
		
		// ********** Your drawing code here **********					// 2
		myContext?.setFillColor(red: 1, green: 0, blue: 0, alpha: 1)
		myContext?.fill(CGRect(x: 0, y: 0, width: 200, height: 100))
		myContext?.setFillColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
		myContext?.fill(CGRect(x: 0, y: 0, width: 100, height: 200))
    }

}
