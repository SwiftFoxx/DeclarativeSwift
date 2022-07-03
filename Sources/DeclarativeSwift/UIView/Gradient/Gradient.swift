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

public class Gradient: NSObject, ViewBackgroundConvertible {
    var colors: [UIColor]
    var gradientType: CAGradientLayerType = .axial
    var direction: GradientDirection = .minXmaxX
    var locations: [NSNumber]? = nil
    
    public init(colors: UIColor..., gradientType: CAGradientLayerType, gradientDirection: GradientDirection = .minXmaxX, locations: [NSNumber]? = nil) {
        self.colors = colors
        self.gradientType = gradientType
        self.direction = gradientDirection
        self.locations = locations
    }
    
    public enum GradientDirection {
        case minXmaxX
        case maxXminX
        case minYmaxY
        case maxYminY
        case anyXY(CGPoint, CGPoint)
        
        var startPoint: CGPoint {
            switch self {
                case .minXmaxX:
                    return .zero
                case .maxXminX:
                    return CGPoint(x: 1, y: 0)
                case .minYmaxY:
                    return .zero
                case .maxYminY:
                    return CGPoint(x: 0, y: 1)
                case .anyXY(let point, _):
                    return point
            }
        }
        
        var endPoint: CGPoint {
            switch self {
                case .minXmaxX:
                    return CGPoint(x: 1, y: 0)
                case .maxXminX:
                    return .zero
                case .minYmaxY:
                    return CGPoint(x: 0, y: 1)
                case .maxYminY:
                    return .zero
                case .anyXY(_, let point):
                    return point
            }
        }
    }
    
    public var needsEmbedding: Bool {
        true
    }
    
    public var `class`: String {
        "Gradient"
    }
}

extension UIView {
    @usableFromInline
    func color(from gradient: Gradient) -> UIColor? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = gradient.colors.map { $0.cgColor }
        gradientLayer.startPoint = gradient.direction.startPoint
        gradientLayer.endPoint = gradient.direction.endPoint
        gradientLayer.type = gradient.gradientType
        gradientLayer.locations = gradient.locations
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        gradientLayer.render(in: context)
        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        let color = UIColor(patternImage: gradientImage)
        return color
    }
}
