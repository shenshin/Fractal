//
//  View.swift
//  Fractal
//
//  Created by Алесь Шеншин on 10/02/2019.
//  Copyright © 2019 Shenshin. All rights reserved.
//

import UIKit

struct Point {
    
    public enum Position {
        case rightBottom
        case rightTop
        case leftBottom
        case leftTop
        case centerCenter
        case centerTop
        case centerBottom
        case leftCenter
        case rightCenter
    }
    
    private func screenPosition(_ position: Position, _ lineWidth: CGFloat = 0)->CGPoint {
        switch position {
            
        case .leftTop:
            return CGPoint(x: rect.minX + lineWidth/2, y: rect.minY + lineWidth/2)
        case .centerTop:
            return CGPoint(x: rect.midX - size/2, y: rect.minY + lineWidth/2)
        case .rightTop:
            return CGPoint(x: rect.maxX - size - lineWidth/2, y: rect.minY + lineWidth/2)
            
        case .leftCenter:
            return CGPoint(x: rect.minX + lineWidth/2, y: rect.midY - size/2)
        case .centerCenter:
            return CGPoint(x: self.rect.midX - size/2, y: self.rect.midY - size/2)
        case .rightCenter:
            return CGPoint(x: rect.maxX - size - lineWidth/2, y: rect.midY - size/2)
            
        case .leftBottom:
            return CGPoint(x: rect.minX + lineWidth/2, y: rect.maxY - size - lineWidth/2)
        case .centerBottom:
            return CGPoint(x: rect.midX - size/2, y: rect.maxY - size - lineWidth/2)
        case .rightBottom:
            return CGPoint(x: rect.maxX - size - lineWidth/2, y: rect.maxY - size - lineWidth/2)
        }
    }
    
    private let size: CGFloat
    private let rect: CGRect
    private let cgSize: CGSize
    private let context: CGContext
    
    init(inside rect: CGRect, withSize pointSize: CGFloat) {
        size = pointSize
        self.rect = rect
        cgSize = CGSize(width: size, height: size)
        if let context =  UIGraphicsGetCurrentContext(){
            self.context = context
        } else {fatalError()}
    }
    
    public func fill(_ position: Position){
        let origin = screenPosition(position, 0)
        context.setFillColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(origin: origin, size: cgSize))
        context.fillPath()
    }
    
    public func stroke(_ position: Position, _ lineWidth: CGFloat = 10){
        let origin = screenPosition(position, lineWidth)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(lineWidth)
        context.addEllipse(in: CGRect(origin: origin, size: cgSize))
        context.strokePath()
    }
}
