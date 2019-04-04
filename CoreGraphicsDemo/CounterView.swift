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
    
    @IBInspectable var counter: Int = 3 {
        didSet {
            if counter <=  Constants.numberOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor(r: 120, g: 0, b: 0)
    @IBInspectable var counterColor: UIColor = UIColor(r: 200, g: 70, b: 70)
    
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
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
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
        
        
        //Counter View markers
        let context = UIGraphicsGetCurrentContext()!
        
        //1 - save original state
        context.saveGState()
        outlineColor.setFill()
        
        let markerWidth: CGFloat = 5.0
        let markerSize: CGFloat = 10.0
        
        //2 - the marker rectangle positioned at the top left
        let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth / 2, y: 0, width: markerWidth, height: markerSize))
        
        //3 - move top left of context to the previous center position
        context.translateBy(x: rect.width / 2, y: rect.height / 2)
        
        for i in 1...Constants.numberOfGlasses {
            //4 - save the centred context
            context.saveGState()
            //5 - calculate the rotation angle
            let angle = arcLengthPerGlass * CGFloat(i) + startAngle - .pi / 2
            //rotate and translate
            context.rotate(by: angle)
            context.translateBy(x: 0, y: rect.height / 2 - markerSize)
            
            //6 - fill the marker rectangle
            markerPath.fill()
            //7 - restore the centred context for the next rotate
            context.restoreGState()
        }
        
        //8 - restore the original state in case of more painting
        context.restoreGState()
    }

}
