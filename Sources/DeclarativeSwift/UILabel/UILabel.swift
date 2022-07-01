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

public extension UILabel {
    @discardableResult
    func settingText(_ value: String) -> UILabel {
        text = value
        return self
    }
    
    @discardableResult
    func settingText(color value: UIColor?) -> UILabel {
        textColor = value
        return self
    }
    
    @discardableResult
    func settingText(alignment value: NSTextAlignment) -> UILabel {
        textAlignment = value
        return self
    }
    
    @discardableResult
    func settingFont(_ value: UIFont) -> UILabel {
        font = value
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> UILabel {
        lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func settingAttributed(text aT: NSAttributedString) -> UILabel {
        attributedText = aT
        return self
    }
    
    @discardableResult
    func enabled(_ value: Bool) -> UILabel {
        isEnabled = value
        return self
    }
    
    @discardableResult
    func numberOfLines(_ number: Int) -> UILabel {
        numberOfLines = number
        return self
    }
    
    @discardableResult
    /// Apply a gradient to the appearance of the text.
    /// - Parameter gradient: `Gradient` properties
    /// - Returns: The receiver of type `UILabel`
    func applying(_ gradient: Gradient) -> UILabel {
        textColor = color(from: gradient)
        return self
    }
}
