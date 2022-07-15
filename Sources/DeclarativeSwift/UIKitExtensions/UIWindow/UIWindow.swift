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

public extension UIWindow {
    /// <#Description#>
    static let keyWindow: UIWindow? = {
        UIApplication
            .shared
            .connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?
            .windows
            .filter({ $0.isKeyWindow })
            .first
    }()
    
    @discardableResult
    /// <#Description#>
    /// - Returns: <#description#>
    func makingKey() -> UIWindow {
        makeKey()
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Returns: <#description#>
    func makingKeyAndVisible() -> UIWindow {
        makeKeyAndVisible()
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Returns: <#description#>
    func resigningKey() -> UIWindow {
        resignKey()
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Parameter event: <#event description#>
    /// - Returns: <#description#>
    func sendingEvent(_ event: UIEvent) -> UIWindow {
        sendEvent(event)
        return self
    }
    
    typealias PointConversionCompletion = (CGPoint) -> Void
    
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - point: <#point description#>
    ///   - window: <#window description#>
    ///   - conversionCompletion: <#conversionCompletion description#>
    /// - Returns: <#description#>
    func converting(_ point: CGPoint, to window: UIWindow?, conversionCompletion: @escaping PointConversionCompletion) -> UIWindow {
        conversionCompletion(convert(point, to: window))
        return self
    }
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - point: <#point description#>
    ///   - window: <#window description#>
    ///   - conversionCompletion: <#conversionCompletion description#>
    /// - Returns: <#description#>
    func converting(_ point: CGPoint, from window: UIWindow?, conversionCompletion: @escaping PointConversionCompletion) -> UIWindow {
        conversionCompletion(convert(point, from: window))
        return self
    }
    
    typealias RectConversionCompletion = (CGRect) -> Void
    
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - rect: <#rect description#>
    ///   - window: <#window description#>
    ///   - conversionCompletion: <#conversionCompletion description#>
    /// - Returns: <#description#>
    func converting(_ rect: CGRect, to window: UIWindow?, conversionCompletion: @escaping RectConversionCompletion) -> UIWindow {
        conversionCompletion(convert(rect, to: window))
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - rect: <#rect description#>
    ///   - window: <#window description#>
    ///   - conversionCompletion: <#conversionCompletion description#>
    /// - Returns: <#description#>
    func converting(_ rect: CGRect, from window: UIWindow?, conversionCompletion: @escaping RectConversionCompletion) -> UIWindow {
        conversionCompletion(convert(rect, from: window))
        return self
    }
}
