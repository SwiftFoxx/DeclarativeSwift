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

public extension UIImageView {
    @discardableResult
    func setting(image i: UIImage) -> UIImageView {
        viewWithTag(10105)?.removeFromSuperview()
        image = i
        return self
    }
    
    @discardableResult
    func settingAnimation(image i: [UIImage], duration d: TimeInterval, repeatCount rc: Int = 0) -> UIImageView {
        viewWithTag(10105)?.removeFromSuperview()
        animationImages = i
        animationDuration = d
        animationRepeatCount = rc
        return self
    }
    
    @discardableResult
    func setting(imageFrom url: URL?,
                 allowingCellular cellular: Bool = false,
                 ignoresLowDataMode constrained: Bool = false,
                 ignoresExpensive isExpensive: Bool = false) async -> UIImageView {
        guard let url = url else { return self }
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.allowsCellularAccess = cellular
        sessionConfiguration.allowsConstrainedNetworkAccess = constrained
        sessionConfiguration.allowsExpensiveNetworkAccess = isExpensive
        sessionConfiguration.httpAdditionalHeaders = ["request-client" : "DeclarativeSwift"]
        sessionConfiguration.httpCookieStorage = .shared
        sessionConfiguration.networkServiceType = .background
        do {
            let (data, response) = try await URLSession(configuration: sessionConfiguration).data(from: url)
            guard let mimeType = response.mimeType, mimeType.hasPrefix("image") else {
                NSLog("The mimeType in the response does not indicate the existence of image.")
                return self
            }
            let downloadedImage = UIImage(data: data)
            DispatchQueue.main.async { [self] in
                viewWithTag(10105)?.removeFromSuperview()
                image = downloadedImage
            }
        } catch {
            NSLog("Image download encountered error: \(error)")
        }
        return self
    }
    
    @discardableResult
    func placeholder(forced: Bool = false, @PlaceholderBuilder _ content: () -> UIView) -> UIImageView {
        if forced || image == nil {
            let placeholderView = content().changing(frame: bounds).tagging(10105)
            addSubview(placeholderView)
        }
        return self
    }
    
    @discardableResult
    func placeholder(forced: Bool = false, @PlaceholderBuilder _ content: () -> UIImage) -> UIImageView {
        if forced || image == nil {
            image = content()
        }
        return self
    }
}
