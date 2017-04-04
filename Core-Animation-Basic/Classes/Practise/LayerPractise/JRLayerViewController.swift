//
//  JRLayerViewController.swift
//  Core-Animation-Basic
//
//  Created by 王潇 on 2017/4/4.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRLayerViewController: JRBaseViewController {

	var layer = CALayer()
	var maskLayer = CALayer()
	var image = CALayer()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.white
		setupUI()
    }
}

///
extension JRLayerViewController {
	
	///
	func setupUI() {
		
		/// layer
		layer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
		layer.position = CGPoint(x: 200, y: 200)
		layer.backgroundColor = UIColor.red.cgColor
		layer.contents = #imageLiteral(resourceName: "stamp").cgImage
		view.layer.addSublayer(layer)
		
		/// mask
		maskLayer.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
		maskLayer.backgroundColor = UIColor.yellow.withAlphaComponent(0.4).cgColor
//		layer.mask = maskLayer
		
		/// image
		image.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
		image.contents = #imageLiteral(resourceName: "circle").cgImage
		layer.mask = image
	}
	
	/// 点击事件
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let point = touches.first?.location(in: self.view)
		if (self.layer.hitTest(point!) != nil) {
			self.layer.backgroundColor = UIColor.yellow.cgColor
		} else {
			self.layer.backgroundColor = UIColor.red.cgColor
		}
	}
	
}
