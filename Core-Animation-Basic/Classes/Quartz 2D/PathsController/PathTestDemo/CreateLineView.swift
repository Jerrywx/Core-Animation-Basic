//
//  CreateLineView.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/17.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class CreateLineView: UIView {

	
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        /// 1. 获取上下文
		let ctx = UIGraphicsGetCurrentContext()
		
		/// 2. 添加起始点
		ctx?.move(to: CGPoint(x: 20, y: 20))
		
		/// 3. 添加线
		ctx?.addLine(to: CGPoint(x: 20, y: rect.size.height - 20))
		
		/// 4. 设置绘制颜色
		ctx?.setStrokeColor(UIColor.black.cgColor)
		
		/// 6. 绘制直线
		drawLine(rect: rect, ctx: ctx)
		
		/// 5. 渲染
		ctx?.strokePath()
    }

	func drawLine(rect: CGRect, ctx: CGContext?) {
		
		guard let ctx = ctx else {
			return
		}
		
		let width = rect.size.height - 40
		
		ctx.addLine(to: CGPoint(x: width + 20, y: 20))
		
		ctx.addLine(to: CGPoint(x: width + 20, y: width + 20))
		
		ctx.closePath()
		
	}

}
