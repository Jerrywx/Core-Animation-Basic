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
	let width = UIScreen.main.bounds.size.width - 40
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupUI()
    }

}

// MARK: - UI
extension JRContextsViewController {
	
	func setupUI() {
		
		title = "Graphics Contexts"
		
		normalView = NormalView(frame: CGRect(x: 20, y: 80, width: width, height: width * 0.5))
		normalView?.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
		view.addSubview(normalView!)
		
		
		
		let myBitmapContext = createBitmp(width: Int(width), height: Int(width * 0.5))
		// ********** Your drawing code here ********** // 4
		myBitmapContext.setFillColor(UIColor.red.cgColor)
		myBitmapContext.fill(CGRect(x: 0, y: 0, width: 200, height: 100))
		myBitmapContext.setFillColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
		myBitmapContext.fill(CGRect(x: 0, y: 0, width: 100, height: 200))
		
		let myImage = myBitmapContext.makeImage()
		imgView = UIImageView(frame: CGRect(x: 20, y: (normalView?.frame.maxY)! + 20, width: width, height: width * 0.5))
		imgView?.image = UIImage(cgImage: myImage!)
		view.addSubview(imgView!)
	}
	
	/// <#Description#>
	///
	/// - Parameters:
	///   - pixelsWide: <#pixelsWide description#>
	///   - pixelsHigh: <#pixelsHigh description#>
	/// - Returns: <#return value description#>
	func createBitmpContext(pixelsWide: Int, pixelsHigh: Int) -> CGContext? {
	
		var context: CGContext?
		var colorSpace: CGColorSpace
//		void *          bitmapData;
		var bitmapByteCount: Int
		var bitmapBytesPerRow: Int
	 
		bitmapBytesPerRow   = (pixelsWide * 4); // 1
		bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
		colorSpace = CGColorSpaceCreateDeviceRGB()
		let bitmapData = malloc(bitmapByteCount)
		context = CGContext(data: bitmapData,
		                    width: pixelsWide, 
		                    height: pixelsHigh, 
		                    bitsPerComponent: 8, 
		                    bytesPerRow: bitmapBytesPerRow, 
		                    space: colorSpace,
		                    bitmapInfo: CGImageAlphaInfo.first.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
		return context;// 7
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
		
		let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)
		
		let contex : CGContext = CGContext(data: rawData, width: width, height: height, bitsPerComponent: bitsPerCompontent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
		
		contex.setFillColor(UIColor.gray.withAlphaComponent(0.5).cgColor)
		contex.fill(CGRect(x: 0, y: 0, width: width, height: height))
		
		return contex
	}
}







