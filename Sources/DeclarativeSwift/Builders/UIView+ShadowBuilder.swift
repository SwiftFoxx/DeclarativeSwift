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

@resultBuilder
public struct ShadowBuilder {
    public static func buildBlock(_ components: [Shadow.ShadowProperties : Any]) -> Shadow {
        Shadow(
            shadowPath: components[.shadowPath] as? UIBezierPath,
            shadowColor: components[.shadowColor] as? UIColor,
            shadowOffset: components[.shadowOffset] as? CGSize ?? .zero,
            shadowRadius: components[.shadowRadius] as? CGFloat ?? 8,
            opacity: components[.opacity] as? Float ?? 0.2
        )
    }
}

/// - Tag: Shadow
public struct Shadow {
    var shadowPath: UIBezierPath?
    var shadowColor: UIColor?
    var shadowOffset: CGSize = .zero
    var shadowRadius: CGFloat
    var opacity: Float
    
    public enum ShadowProperties {
        case shadowPath
        case shadowColor
        case shadowOffset
        case shadowRadius
        case opacity
    }
    
}
