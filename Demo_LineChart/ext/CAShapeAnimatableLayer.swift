//
//  CAShapeAnimatableLayer.swift
//  Demo_LineChart
//
//  Created by Valeriy Bezuglyy on 19/03/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class CAShapeAnimatableLayer: CAShapeLayer {
    override func action(forKey event: String) -> CAAction? {
        if event == "path" {
            let animation = CABasicAnimation(keyPath: event)
            animation.duration = 0.1
            animation.timingFunction = CATransaction.animationTimingFunction()
            return animation
        }
        return super.action(forKey: event)
    }
}