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
    
    convenience init?(path: String, scale: CGFloat = 1) {
        if path.isRemotePath {
            var data: Data?
            let semaphore = DispatchSemaphore(value: 1)
            guard let url = URL(string: path) else { return nil }
            DispatchQueue(
                label: "declarativeswift.background",
                qos: .background,
                attributes: .concurrent
            ).async {
                data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    semaphore.signal()
                }
            }
            semaphore.wait()
            if let data = data {
                self.init(data: data, scale: scale)
            } else {
                return nil
            }
        } else {
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else { return nil }
            self.init(data: data, scale: scale)
        }
    }
    
    func cropped(to rect: CGRect) -> UIImage? {
        guard rect.size.width <= size.width, rect.size.height <= size.height else { return nil }
        let scaledRect = rect.applying(CGAffineTransform(scaleX: scale, y: scale))
        guard let image = cgImage?.cropping(to: scaledRect) else { return nil }
        return UIImage(cgImage: image, scale: scale, orientation: imageOrientation)
    }
    
    func compressed(quality: CGFloat) -> UIImage? {
        guard let data = jpegData(compressionQuality: quality) else { return nil }
        return UIImage(data: data)
    }
    
    func compressed(quality: CGFloat) -> Data? {
        jpegData(compressionQuality: quality)
    }
    
    func tinted(with color: UIColor, blendMode: CGBlendMode, opacity: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let rect = CGRect(origin: .zero, size: size)
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        context?.fill(rect)
        draw(in: rect, blendMode: blendMode, alpha: opacity)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

public extension UIImage.Orientation {
    init(_ rawValue: CGImagePropertyOrientation) {
        switch rawValue {
            case .up:
                self = .up
            case .upMirrored:
                self = .upMirrored
            case .down:
                self = .down
            case .downMirrored:
                self = .downMirrored
            case .leftMirrored:
                self = .leftMirrored
            case .right:
                self = .right
            case .rightMirrored:
                self = .rightMirrored
            case .left:
                self = .left
        }
    }
}
