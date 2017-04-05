//
//  MyLayer.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/5.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class MyLayer: CALayer {

	override func display() {
		super.display()
//		contents = #imageLiteral(resourceName: "star").cgImage
		contentsGravity = "kCAGravityRight"
		contents = #imageLiteral(resourceName: "circle").cgImage
	}
	
	override func draw(in ctx: CGContext) {
		super.draw(in: ctx)
		ctx.setLineWidth(4.0);  //圓形線的寬度
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.stroke(bounds)
	}
	
}
