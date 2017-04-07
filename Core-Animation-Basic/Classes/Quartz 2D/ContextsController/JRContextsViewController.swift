//
//  JRContextsViewController.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRContextsViewController: JRBaseViewController {

	var normalView: NormalView?
	var imgView: UIImageView?
	let width = UIScreen.main.bounds.size.width - 60
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupUI()
    }

}

// MARK: - UI
extension JRContextsViewController {
	
	func setupUI() {
		
		let w = width * 0.5
		
		title = "Graphics Contexts"
		
		normalView = NormalView(frame: CGRect(x: 20, y: 80, width: w, height: w))
		normalView?.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
		view.addSubview(normalView!)
		
		
		
		let myBitmapContext = createBitmp(width: Int(w), height: Int(w))
		// ********** Your drawing code here ********** // 4
		myBitmapContext.setFillColor(UIColor.red.cgColor)
		myBitmapContext.fill(CGRect(x: 0, y: 0, width: w, height: w * 0.5))
		myBitmapContext.setFillColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
		myBitmapContext.fill(CGRect(x: 0, y: 0, width: w * 0.5, height: w))
		
		let myImage = myBitmapContext.makeImage()
		imgView = UIImageView(frame: CGRect(x: (normalView?.frame.maxX)! + 20, y: 80, width: w, height: w))
		imgView?.image = UIImage(cgImage: myImage!)
		view.addSubview(imgView!)
	}

	/// 创建 bitmap 上下文
	///
	/// - Parameters:
	///   - width: 宽度
	///   - height: 高度
	/// - Returns: 返回上下文
	func createBitmp(width: Int, height: Int) -> CGContext {

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let rawData:UnsafeMutablePointer<CGFloat> = UnsafeMutablePointer<CGFloat>.allocate(capacity: height*width*4)
		let bytesPerPixel = 4
		let bitsPerCompontent = 8
		let bytesPerRow = bytesPerPixel * width
		
		let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.noneSkipLast.rawValue)
		
		let contex : CGContext = CGContext(data: rawData, width: width, height: height, bitsPerComponent: bitsPerCompontent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
		
		contex.setFillColor(UIColor.gray.withAlphaComponent(0.5).cgColor)
		contex.fill(CGRect(x: 0, y: 0, width: width, height: height))
		
		return contex
	}
}







