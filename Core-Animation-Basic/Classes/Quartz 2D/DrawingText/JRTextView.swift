//
//  JRTextView.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRTextView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		
		let ctx = UIGraphicsGetCurrentContext()
		
		drawText(rect: rect, ctx: ctx)
    }

	func drawText(rect: CGRect, ctx: CGContext?) {
		
		guard let ctx = ctx else {
			return
		}
		
		rotateCtx(ctx: ctx)
		scaleCtx(ctx: ctx)
	}
	
	/// 旋转
	///
	/// - Parameter ctx: CGContext
	func rotateCtx(ctx: CGContext) {
		ctx.saveGState()
		ctx.addRect(CGRect(x: 50, y: 0, width: 80, height: 80))
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()
		
		ctx.rotate(by: 0.2)
		ctx.addRect(CGRect(x: 50, y: 0, width: 80, height: 80))
		ctx.setStrokeColor(UIColor.red.cgColor)
		
		ctx.rotate(by: 0.4)
		ctx.addRect(CGRect(x: 50, y: 0, width: 80, height: 80))
		ctx.setStrokeColor(UIColor.red.cgColor)
		
		ctx.rotate(by: 0.6)
		ctx.addRect(CGRect(x: 50, y: 0, width: 80, height: 80))
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()
		ctx.restoreGState()
	}

	/// 缩放
	///
	/// - Parameter ctx: CGContext
	func scaleCtx(ctx: CGContext) {
		
		ctx.setStrokeColor(UIColor.blue.cgColor)
		ctx.scaleBy(x: 2, y: 1)
		ctx.addEllipse(in: CGRect(x: 100, y: 100, width: 80, height: 80))
		ctx.strokePath()
		
	}
	
}
