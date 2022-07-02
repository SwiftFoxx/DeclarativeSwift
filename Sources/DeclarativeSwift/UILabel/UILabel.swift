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
    /// Initializes and returns a `UILabel` object with specified **text** and **textStyle**.
    /// - Parameters:
    ///   - text: The text to be displayed
    ///   - style: Font style, one of `largeTitle`, `title`, `title2` etc. Default is `body`.
    convenience init(text: String?, textStyle style: UIFont.TextStyle = .body) {
        self.init()
        settingText(text)
        .settingFont(UIFont.preferredFont(forTextStyle: style))
    }
    
    @discardableResult
    /// Set the the text, substitute for `text = <String>`
    /// - Parameter value: The `String` to be displayed
    /// - Returns: The receiver of type `UILabel`
    func settingText(_ value: String?) -> UILabel {
        text = value
        return self
    }
    
    @discardableResult
    /// Set the text color, substitute for `textColor = <UIColor>`
    /// - Parameter value: The color to apply to the text
    /// - Returns: The receiver of type `UILabel`
    func settingText(color value: UIColor?) -> UILabel {
        textColor = value
        return self
    }
    
    @discardableResult
    /// Set the alignment of the text, substitute for `textAlignment = <NSTextAlignment>`
    /// - Parameter value: Value of type `NSTextAlignment` to apply to the `UILabel`
    /// - Returns: The receiver of type `UILabel`
    func settingText(alignment value: NSTextAlignment) -> UILabel {
        textAlignment = value
        return self
    }
    
    @discardableResult
    /// Set the font to the `UILabel`, substitute for `font = <UIFont>`
    /// - Parameter value: Value of type `UIFont`
    /// - Returns: The receiver of type `UILabel`
    func settingFont(_ value: UIFont) -> UILabel {
        font = value
        return self
    }
    
    @discardableResult
    /// Apply the line break mode
    /// - Parameter mode: Value of type `NSLineBreakMode`
    /// - Returns: The receiver of type `UILabel`
    func lineBreakMode(_ mode: NSLineBreakMode) -> UILabel {
        lineBreakMode = mode
        return self
    }
    
    @discardableResult
    /// Set attributed text to the `UILabel`
    /// - Parameter aT: The attributed string of type `NSAttributedString`
    /// - Returns: The receiver of type `UILabel`
    func settingAttributed(text aT: NSAttributedString) -> UILabel {
        attributedText = aT
        return self
    }
    
    @discardableResult
    /// Set the enabled state
    /// - Parameter value: Value of type `Bool`
    /// - Returns: The receiver of type `UILabel`
    func enabled(_ value: Bool) -> UILabel {
        isEnabled = value
        return self
    }
    
    @discardableResult
    /// Set the number of lines, substitute for `numberOfLines = <Int>`
    /// - Parameter number: Value of type `Int`
    /// - Returns: The receiver of type `UILabel`
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
    
    @discardableResult
    /// Add attribute to `UILabel`
    /// - Parameters:
    ///   - range: The range of the string to apply attributes
    func attribute(textIn range: Range<String.Index>?, _ attributes: [NSAttributedString.Key : Any]) -> UILabel {
        guard let range = range else {
            NSLog("Could not get the text range")
            return self
        }
        guard let text = text else {
            NSLog("Could not get the text property")
            return self
        }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes(attributes, range: NSRange(range, in: text))
        attributedText = attributedString
        return self
    }
    
    @discardableResult
    /// Add attribute to UILabel
    /// - Parameters:
    ///   - ranges: The ranges of the strings to apply attributes
    func attribute(textIn ranges: Array<Range<String.Index>?>, _ attributes: [NSAttributedString.Key : Any]) -> UILabel {
        guard let text = text else {
            NSLog("Could not get the text property")
            return self
        }
        let finalRanges = ranges.compactMap { $0 }
        let attributedString = NSMutableAttributedString(string: text)
        for range in finalRanges {
            attributedString.addAttributes(attributes, range: NSRange(range, in: text))
        }
        attributedText = attributedString
        return self
    }
}
