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

public extension UITextField {
    convenience init(frame: CGRect, delegate: UITextFieldDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    @discardableResult
    func setting(text t: String?) -> UITextField {
        text = t
        return self
    }
    
    @discardableResult
    func setting(textColor tc: UIColor?) -> UITextField {
        textColor = tc
        return self
    }
    
    @discardableResult
    func setting(font f: UIFont?) -> UITextField {
        font = f
        return self
    }
    
    @discardableResult
    func setting(textAlignment alignment: NSTextAlignment) -> UITextField {
        textAlignment = alignment
        return self
    }
    
    @discardableResult
    func enabled(_ value: Bool) -> UITextField {
        isEnabled = value
        return self
    }
    
    @discardableResult
    func setting(attributedText at: NSAttributedString) -> UITextField {
        attributedText = at
        return self
    }
    
    @discardableResult
    func setting(borderStyle bs: UITextField.BorderStyle) -> UITextField {
        borderStyle = bs
        return self
    }
    
    @discardableResult
    func setting(defaultTextAttributes ta: [NSAttributedString.Key : Any]) -> UITextField {
        defaultTextAttributes = ta
        return self
    }
    
    @discardableResult
    func setting(placeholder pl: String?) -> UITextField {
        placeholder = pl
        return self
    }
    
    @discardableResult
    func setting(attributedPlaceholder ap: NSAttributedString) -> UITextField {
        attributedPlaceholder = ap
        return self
    }
    
    @discardableResult
    func setting(minimumFontSize min: CGFloat) -> UITextField {
        minimumFontSize = min
        return self
    }
    
    @discardableResult
    func adding(backgroundImage bg: UIImage?) -> UITextField {
        background = bg
        return self
    }
    
    @discardableResult
    func adding(disableBackgroundImage bg: UIImage?) -> UITextField {
        disabledBackground = bg
        return self
    }
    
    @discardableResult
    func adding(typingAttributes ta: [NSAttributedString.Key : Any]) -> UITextField {
        typingAttributes = ta
        return self
    }
    
    @discardableResult
    func setting(clearButtonMode mode: UITextField.ViewMode) -> UITextField {
        clearButtonMode = mode
        return self
    }
    
    @discardableResult
    func adding(leftView: UIView?, withViewMode mode: UITextField.ViewMode) -> UITextField {
        self.leftView = leftView
        leftViewMode = mode
        return self
    }
    
    @discardableResult
    func adding(rightView: UIView?, withViewMode mode: UITextField.ViewMode) -> UITextField {
        self.rightView = rightView
        rightViewMode = mode
        return self
    }
    
    @discardableResult
    func setToolbar(_ toolbarWithItems: UIToolbar) -> UITextField {
        inputAccessoryView = toolbarWithItems
        return self
    }
    
    @discardableResult
    func setToolbar(
        with items: [UIBarButtonItem],
        toolbarSize: CGSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: 45
        )
    ) -> (UIToolbar, UITextField) {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: toolbarSize))
        toolbar.setItems(items, animated: true)
        inputAccessoryView = toolbar
        return (toolbar, self)
    }
    
    
}
