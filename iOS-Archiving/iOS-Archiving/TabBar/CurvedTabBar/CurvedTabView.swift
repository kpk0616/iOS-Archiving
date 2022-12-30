//
//  CurvedTabView.swift
//  iOS-Archiving
//
//  Created by 박의서 on 2022/12/28.
//

import UIKit

final class CurvedTabView: UIView {
  var shapeLayer: CAShapeLayer!
  override class var layerClass: AnyClass {
    return CAShapeLayer.self
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  private func commonInit() {
    shapeLayer = self.layer as? CAShapeLayer
    shapeLayer.fillColor = UIColor.white.cgColor
    shapeLayer.strokeColor = .none
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let middleRad: CGFloat = 100.0
    
    let cornerRad: CGFloat = 4.0 // 확정
    
    let pth = UIBezierPath()
    
    let topLeftC: CGPoint = CGPoint(x: bounds.minX + cornerRad, y: bounds.minY + cornerRad)
    let topRightC: CGPoint = CGPoint(x: bounds.maxX - cornerRad, y: bounds.minY + cornerRad)

    var pt: CGPoint!

    // 1
    pt = CGPoint(x: bounds.minX, y: bounds.minY + cornerRad)
    pth.move(to: pt)

    // c1
    pth.addArc(withCenter: topLeftC, radius: cornerRad, startAngle: .pi * 1.0, endAngle: .pi * 1.5, clockwise: true)
    
    // 2
    pt = CGPoint(x: bounds.midX - middleRad * 0.5, y: bounds.minY)
    pth.addLine(to: pt)
    
    // c2
    pt.y += cornerRad * 0.5
    pth.addArc(withCenter: pt, radius: cornerRad * 0.5, startAngle: -.pi * 0.5, endAngle: 0.0, clockwise: true)
    
    // c3
    pt.x += middleRad * 0.5 + cornerRad * 0.5
    pth.addArc(withCenter: pt, radius: middleRad * 0.5, startAngle: .pi * 1.0, endAngle: 0.0, clockwise: false)
    
    // c4
    pt.x += middleRad * 0.5 + cornerRad * 0.5
    pth.addArc(withCenter: pt, radius: cornerRad * 0.5, startAngle: .pi * 1.0, endAngle: .pi * 1.5, clockwise: true)
    
    // 3
    pt = CGPoint(x: bounds.maxX - cornerRad, y: bounds.minY)
    pth.addLine(to: pt)
    
    // c5
    pth.addArc(withCenter: topRightC, radius: cornerRad, startAngle: -.pi * 0.5, endAngle: 0.0, clockwise: true)
    
    // 4
    pt = CGPoint(x: bounds.maxX, y: bounds.maxY - cornerRad)
    pth.addLine(to: pt)
    
    // 5
    pt = CGPoint(x: bounds.minX + cornerRad, y: bounds.maxY)
    pth.addLine(to: pt)
    
    pth.close()
    
    shapeLayer.path = pth.cgPath
    
  }
}
