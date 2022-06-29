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

public extension UIButton {
    @discardableResult
    func setting(title: String?, for state: UIControl.State) -> UIButton {
        setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func setting(titleColor: UIColor?, for state: UIControl.State) -> UIButton {
        setTitleColor(titleColor, for: state)
        return self
    }
    
    @discardableResult
    func setting(titleShadowColor: UIColor?, for state: UIControl.State) -> UIButton {
        setTitleShadowColor(titleShadowColor, for: state)
        return self
    }
    
    @discardableResult
    func setting(image: UIImage?, for state: UIControl.State) -> UIButton {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setting(backgroundImage image: UIImage?, for state: UIControl.State) -> UIButton {
        setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setting(attributedTitle title: NSAttributedString?, for state: UIControl.State) -> UIButton {
        setAttributedTitle(title, for: state)
        return self
    }
    
    @discardableResult @inlinable
    func adding(_ action: AnyAction, for event: UIControl.Event = .touchUpInside) -> UIButton {
        addTarget(action, action: #selector(action.invoke), for: event)
        objc_setAssociatedObject(self, String(ObjectIdentifier(self).hashValue) + String(event.rawValue), action, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func menu(_ menu: UIMenu, showsMenuAsPrimaryAction isPrimary: Bool = true) -> UIButton {
        self.menu = menu
        showsMenuAsPrimaryAction = isPrimary
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func adding(_ action: UIAction, for event: UIControl.Event = .touchUpInside) -> UIButton {
        addAction(action, for: event)
        return self
    }
}
