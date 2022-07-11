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

public extension UIImage {
    /// Create an `UIImage` from the specified color.
    /// - Parameters:
    ///   - color: The source color.
    ///   - targetSize: The size the image should render.
    convenience init(from color: UIColor, size targetSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1)
        defer {
            UIGraphicsEndImageContext()
        }
        color.setFill()
        UIRectFill(
            CGRect(
                origin: .zero,
                size: targetSize
            )
        )
        guard let newCGImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: newCGImage)
    }
    
    /// Create an `UIImage` from the specified gradient.
    /// - Parameters:
    ///   - gradient: The source Gradient.
    ///   - targetSize: The size the image should render.
    convenience init(from gradient: Gradient, size targetSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1)
        defer {
            UIGraphicsEndImageContext()
        }
        Gradient.color(
            from: gradient,
            frame: CGRect(
                origin: .zero,
                size: targetSize
            )
        )?.setFill()
        UIRectFill(
            CGRect(
                origin: .zero,
                size: targetSize
            )
        )
        guard let newCGImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: newCGImage)
    }
    
    
}
