//
//  ContextsView.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ContextsView: UIView {

	
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		/// 获取上下文
		let ctx = UIGraphicsGetCurrentContext()
		
		drawContext(rect: rect, ctx: ctx)
		
    }
	
	/// 上下文 入栈 出栈
	func drawContext(rect:CGRect, ctx: CGContext?) {
		
		guard let ctx = ctx else {
			return
		}
		
		ctx.setStrokeColor(UIColor.black.cgColor)
		ctx.setLineWidth(4)
		/// 入栈
		ctx.saveGState()
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.setLineWidth(1)
		ctx.addRect(CGRect(x: 20, y: 20,
		                    width: rect.size.width - 40,
		                    height: rect.size.height - 40))
		/// 渲染
		ctx.strokePath()
		/// 出站
		ctx.restoreGState()
		ctx.addRect(CGRect(x: 40, y: 40,
		                    width: rect.size.width - 80,
		                    height: rect.size.height - 80))
		/// 渲染
		ctx.strokePath()

	}
}


extension ContextsView {
	
	/*
		1. Pushes a copy of the current graphics state onto the graphics state stack for the context.
			func saveGState()
	
		2. Sets the current graphics state to the state most recently saved.
			func restoreGState()
	*/
	
}




