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

import UIKit

@MainActor
public struct Animation {
    // Durations
    public static var defaultDuration: TimeInterval = 0.35
    // Wait
    public static func wait(_ seconds: TimeInterval) {
        
    }
    
    public static func wait(_ seconds: Int) {
        
    }
    // Signal
    public static func signal() {
        
    }
    // Group
    public static func group() {
        
    }
    
    public static func synced(delay: TimeInterval/*, @AnimationBuilder _ block: () -> <#Type#>*/) {
        
    }
    
    // TimingFunctions
    public static let `default`: CAMediaTimingFunction = CAMediaTimingFunction(name: .default)
    public static let linear: CAMediaTimingFunction = CAMediaTimingFunction(name: .linear)
    public static let easeIn: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeIn)
    public static let easeOut: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeOut)
    public static let easeInOut: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    // TimingFunction builder
    public func timingFunction(@TimingFunctionBuilder _ block: () -> TimingFunctionControlPoints) -> CAMediaTimingFunction {
        CAMediaTimingFunction(
            controlPoints:
                block().startX,
                block().startY,
                block().finishX,
                block().finishY
        )
    }
    // Animation types
}
