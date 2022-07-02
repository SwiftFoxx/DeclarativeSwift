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

public extension UITextView {
    convenience init(frame: CGRect, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    @discardableResult
    func setting(text t: String) -> UITextView {
        text = t
        return self
    }
    
    @discardableResult
    func setting(textColor tc: UIColor?) -> UITextView {
        textColor = tc
        return self
    }
    
    @discardableResult
    func setting(font f: UIFont?) -> UITextView {
        font = f
        return self
    }
    
    @discardableResult
    func setting(textAlignment alignment: NSTextAlignment) -> UITextView {
        textAlignment = alignment
        return self
    }
    
    @discardableResult
    func makingEditable(_ value: Bool) -> UITextView {
        isEditable = value
        return self
    }
    
    @discardableResult
    func setting(attributedText at: NSAttributedString) -> UITextView {
        attributedText = at
        return self
    }
    
    @discardableResult
    func adding(typingAttributes ta: [NSAttributedString.Key : Any]) -> UITextView {
        typingAttributes = ta
        return self
    }
    
    @discardableResult
    func scrollingRangeToVisible(range: NSRange) -> UITextView {
        scrollRangeToVisible(range)
        return self
    }
    
    @discardableResult
    func setInputView(_ view: UIView) -> UITextView {
        inputView = view
        return self
    }
    
    @discardableResult
    func setInputAccessoryView(_ view: UIView) -> UITextView {
        inputAccessoryView = view
        return self
    }
    
    @discardableResult
    func setTextScaling(_ value: Bool) -> UITextView {
        usesStandardTextScaling = value
        return self
    }
}
