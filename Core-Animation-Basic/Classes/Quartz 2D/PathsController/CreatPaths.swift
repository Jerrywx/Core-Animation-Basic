//
//  CreatPaths.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

/// Path Creation and Path Painting
class CreatPaths: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		
		let ctx = UIGraphicsGetCurrentContext()
		
		creationPath(rect: rect, ctx: ctx)
    }
	
	/// 绘制
	///
	/// - Parameters:
	///   - rect: 范围
	///   - ctx: 上下文
	func creationPath(rect: CGRect, ctx: CGContext?) {
		
		guard let ctx = ctx else {
			return
		}
		
//		addLine
		ctx.move(to: CGPoint(x: 20, y: 20))
		ctx.addLine(to: CGPoint(x: 20, y: 120))
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()

//		setStrokeColor
		let points: [CGPoint] = [CGPoint(x: 40, y: 20),
		                         CGPoint(x: 80, y: 20),
		                         CGPoint(x: 80, y: 60),
		                         CGPoint(x: 40, y: 60),
		                         CGPoint(x: 40, y: 20),]
		ctx.addLines(between: points)
		ctx.setStrokeColor(UIColor.blue.cgColor)
		ctx.strokePath()

//		addRect
		ctx.addRect(CGRect(x: 40, y: 80, width: 40, height: 40))
		ctx.setStrokeColor(UIColor.orange.cgColor)
		ctx.strokePath()
		
//		add​Rects
		let rects: [CGRect] = [CGRect(x: 100, y: 20, width: 100, height: 100),
		                       CGRect(x: 110, y: 30, width: 80, height: 80),
		                       CGRect(x: 120, y: 40, width: 60, height: 60),
		                       CGRect(x: 130, y: 50, width: 40, height: 40),
		                       CGRect(x: 140, y: 60, width: 20, height: 20),]
		ctx.addRects(rects)
		ctx.setStrokeColor(UIColor.black.cgColor)
		ctx.strokePath()
		
//		addEllipse
		ctx.addEllipse(in: CGRect(x: 220, y: 20, width: 100, height: 100))
		ctx.addEllipse(in: CGRect(x: 220, y: 40, width: 100, height: 60))
		ctx.addEllipse(in: CGRect(x: 240, y: 40, width: 60, height: 60))
		ctx.addEllipse(in: CGRect(x: 240, y: 60, width: 60, height: 20))
		ctx.addEllipse(in: CGRect(x: 260, y: 60, width: 20, height: 20))
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.strokePath()
		
	}
}

