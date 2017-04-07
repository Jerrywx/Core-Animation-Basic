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
		
		///
		ctx.move(to: CGPoint(x: 20, y: 20))
		ctx.addLine(to: CGPoint(x: 20, y: rect.size.height - 20))
		ctx.setFillColor(UIColor.red.cgColor)
		ctx.strokePath()
		
		/// 
		ctx.move(to: CGPoint(x: 40, y: 20))
		
		
	}
}

/*
extension CGContext {

	public func setLineDash(phase: CGFloat, lengths: [CGFloat])

	public func move(to point: CGPoint)

	public func addLine(to point: CGPoint)

	public func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint)

	public func addQuadCurve(to end: CGPoint, control: CGPoint)

	public func addRects(_ rects: [CGRect])

	public func addLines(between points: [CGPoint])

	public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)

	public func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat)

	/// Fills the current path using the specified rule (winding by default).
	///
	/// Any open subpath is implicitly closed.
	public func fillPath(using rule: CGPathFillRule = default)

	/// Intersects the current path with the current clipping region and uses the
	/// result as the new clipping region for subsequent drawing.
	///
	/// Uses the specified fill rule (winding by default) to determine which
	/// areas to treat as the interior of the clipping region. When evaluating
	/// the path, any open subpath is implicitly closed.
	public func clip(using rule: CGPathFillRule = default)

	public func fill(_ rects: [CGRect])

	public func strokeLineSegments(between points: [CGPoint])

	public func clip(to rects: [CGRect])

	public func draw(_ image: CGImage, in rect: CGRect, byTiling: Bool = default)

	public var textPosition: CGPoint

	public func showGlyphs(_ glyphs: [CGGlyph], at positions: [CGPoint])
}
*/
