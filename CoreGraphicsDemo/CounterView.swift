//
//  CounterView.swift
//  CoreGraphicsDemo
//
//  Created by Sebastian Strus on 2019-04-01.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {

    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor(red: 34 / 255,
                                                       green: 110 / 255,
                                                       blue: 100 / 255,
                                                       alpha: 1.0)
    @IBInspectable var counterColor: UIColor = UIColor(red: 87 / 255,
                                                       green: 218 / 255,
                                                       blue: 213 / 255,
                                                       alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        // 1
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)/2
        print("radius: \(radius)")
        
        // 3
        let startAngle: CGFloat = (2 * .pi) * (3 / 8)
        let endAngle: CGFloat = (2 * .pi) * (1 / 8)
        
        // 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - Constants.arcWidth/2, // 115 - 38
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 5
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        
        print("startAngle: \(startAngle)")
        print("endAngle: \(endAngle)")
        
        
        //Draw the outline
        
        //1 - first calculate the difference between the two angles
        //ensuring it is positive
        
        let angleDifference: CGFloat = 2 * .pi + endAngle - startAngle
        print("angleDifference: \(angleDifference)")
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(5) + startAngle
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        //4 - close the path
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
    }

}
