//
//  JRArcView.swift
//  Core-Animation-Basic
//
//  Created by 王潇 on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRArcView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		
		let ctx = UIGraphicsGetCurrentContext()
		drawArc(rect: rect, ctx: ctx)
    }
	
	/// 绘制内容
	///
	/// - Parameters:
	///   - rect: CGRect
	///   - ctx: CGConetxt
	func drawArc(rect: CGRect, ctx: CGContext?) {
		
		guard let ctx = ctx else {
			return
		}
//		CGContextAddArc
		
//		addArc
		ctx.addArc(center: CGPoint(x: 70, y: 70), radius: 50, startAngle: 0, endAngle: 1.1415, clockwise: true)
		ctx.setStrokeColor(UIColor.orange.cgColor)
		ctx.strokePath()
		
//		addArc
		ctx.move(to: CGPoint(x: 140, y: 60))
		ctx.addArc(tangent1End: CGPoint(x: 140, y: 20),
		           tangent2End: CGPoint(x: 180, y: 20),
		           radius: 20)
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()
		
//		addCurve
		ctx.move(to: CGPoint(x: 140, y: 70))
		ctx.addCurve(to: CGPoint(x: 260, y: 70), control1: CGPoint(x: 180, y: 50), control2: CGPoint(x: 220, y: 90))
		
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()
	}

}


