//
//  BlendModesView.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/17.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class BlendModesView: UIView {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		
		let ctx = UIGraphicsGetCurrentContext()
		
		ctx?.setBlendMode(CGBlendMode.luminosity)
		
		let image1 = UIImage(named: "model1")
		let imaeg2 = UIImage(named: "model2")
		
//		ctx?.draw((image1?.cgImage)!, in: CGRect(x: 40, y: 20, width: 87, height: 112))
//		ctx?.draw((imaeg2?.cgImage)!, in: CGRect(x: 27.5, y: 45, width: 112, height: 87))
		
		ctx?.draw((image1?.cgImage)!, in: CGRect(x: 40, y: 20, width: 87, height: 112))
		ctx?.draw((imaeg2?.cgImage)!, in: CGRect(x: 27.5, y: 45, width: 112, height: 87))
		
		ctx?.strokePath()
		
    }


}
