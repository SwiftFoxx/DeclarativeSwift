/**
 Copyright 2021 SwiftFoxx
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in the
 Software without restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import CoreGraphics

public extension CGPoint {
    static func fromUniform(value: Int) -> CGPoint {
        CGPoint(x: value, y: value)
    }
    
    static func fromUniform(value: CGFloat) -> CGPoint {
        CGPoint(x: value, y: value)
    }
    
    static func fromUniform(value: Double) -> CGPoint {
        CGPoint(x: value, y: value)
    }
    
    func distance(from p1: CGPoint, to p2: CGPoint) -> CGFloat {
        let dX = p2.x - p1.x
        let dY = p2.y - p1.y
        return sqrt(pow(dX, 2) + pow(dY, 2))
    }
    
    func distance(to point: CGPoint) -> CGFloat {
        distance(from: self, to: point)
    }
    
    func angle(between p1: CGPoint, and p2: CGPoint) -> CGFloat {
        let dPoint = CGPoint(x: p2.x - p1.x, y: p2.y - p1.y)
        let bearingRad = atan2(dPoint.y, dPoint.x)
        var bearingDeg = bearingRad * (180 / .pi)
        bearingDeg = bearingRad > 0 ? bearingRad : (bearingRad + 360)
        return bearingDeg
    }
    
    func angle(with point: CGPoint) -> CGFloat {
        angle(between: self, and: point)
    }
}
