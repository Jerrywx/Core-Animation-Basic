//
//  LayerContentViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/5.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class LayerContentViewController: JRBaseViewController {

	///
	let layer1 = CALayer()
	let layer2 = CALayer()
	let layer3 = MyLayer()
	
	let width = UIScreen.main.bounds.size.width - 80
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setLayerContentWithImage()
		setLayerContentWithDelegate()
		setLayerUserSubClass()
    }
	
	deinit {
		layer2.delegate = nil
	}
}

// MARK: - 设置 Layer 内容
extension LayerContentViewController {
	
	/// 使用图片为layer 设置显示内容
	/// 1. CALayer 的 contents 设置图片类型是CGImage
	/// 2. 设置 CALayer 的 contentsScale 设置显示倍数
	func setLayerContentWithImage() {
		layer1.frame = CGRect(x: 40, y: 100, width: width, height: width * 0.5)
		layer1.contents = #imageLiteral(resourceName: "star").cgImage
		view.layer.addSublayer(layer1)
	}
	
	/// 使用 delegate 为layer提供内容
	/// 1.CALayer的delegate 实现 CALayerDelegate 协议
	/// 2.需要调用 CALayer的 display() 方法
	/// 3.控制器销毁时 将 CALayer 的delegate = nil
	/// 4.如果重写了 func display(_ layer: CALayer) 就不会执行 func draw(_ layer: CALayer, in ctx: CGContext)
	func setLayerContentWithDelegate() {
		layer2.frame = CGRect(x: 40, y: layer1.frame.maxY + 40, width: width, height: width * 0.5)
		layer2.backgroundColor = UIColor.yellow.cgColor
		layer2.delegate = self
		view.layer.addSublayer(layer2)
		layer2.display()
	}
	
	/// 创建layer子类 绘制内容
	func setLayerUserSubClass() {
		
		layer3.frame = CGRect(x: 40, y: layer2.frame.maxY + 40, width: width, height: width * 0.5)
		layer3.backgroundColor = UIColor.orange.cgColor
		view.layer.addSublayer(layer3)
		layer3.display()
	}
}

// MARK: - CALayerDelegate
extension LayerContentViewController: CALayerDelegate {
	
	/* If defined, called by the default implementation of the -display
	* method, in which case it should implement the entire display
	* process (typically by setting the `contents' property). */
	func display(_ layer: CALayer) {
		print(#function)
		layer.contents = #imageLiteral(resourceName: "star").cgImage
	}
	
	
	/* If defined, called by the default implementation of -drawInContext: */
	func draw(_ layer: CALayer, in ctx: CGContext) {
		print(#function)
		ctx.setLineWidth(2.0);  //圓形線的寬度
		ctx.setStrokeColor(UIColor.red.cgColor)
		ctx.stroke(layer.bounds)
		
	}
	
	
	/* If defined, called by the default implementation of the -display method.
	* Allows the delegate to configure any layer state affecting contents prior
	* to -drawLayer:InContext: such as `contentsFormat' and `opaque'. It will not
	* be called if the delegate implements -displayLayer. */
	func layerWillDraw(_ layer: CALayer) {
		print(#function)
	}
	
	
	/* Called by the default -layoutSublayers implementation before the layout
	* manager is checked. Note that if the delegate method is invoked, the
	* layout manager will be ignored. */
	func layoutSublayers(of layer: CALayer) {
		print(#function)
	}
	
	
	/* If defined, called by the default implementation of the
	* -actionForKey: method. Should return an object implementating the
	* CAAction protocol. May return 'nil' if the delegate doesn't specify
	* a behavior for the current event. Returning the null object (i.e.
	* '[NSNull null]') explicitly forces no further search. (I.e. the
	* +defaultActionForKey: method will not be called.) */
	//	func action(for layer: CALayer, forKey event: String) -> CAAction? {
	//		print(#function)
	//		return nil
	//	}
	
}



