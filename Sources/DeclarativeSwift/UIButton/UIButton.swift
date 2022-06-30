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
    /// Title for normal state
    var titleForNormal: String? {
        get { title(for: .normal) }
        set { setTitle(newValue, for: .normal) }
    }
    
    /// Title for selected state
    var titleForSelected: String? {
        get { title(for: .selected) }
        set { setTitle(newValue, for: .selected) }
    }
    
    /// Title for highlighted state
    @IBInspectable
    var titleForHighlighted: String? {
        get { title(for: .highlighted) }
        set { setTitle(newValue, for: .highlighted) }
    }
    
    /// Title for disabled state
    var titleForDisabled: String? {
        get { title(for: .disabled) }
        set { setTitle(newValue, for: .disabled) }
    }
    
    /// The image for normal state
    var imageForNormal: UIImage? {
        get { image(for: .normal) }
        set { setImage(newValue, for: .normal) }
    }
    
    /// The image for selected state
    var imageForSelected: UIImage? {
        get { image(for: .selected) }
        set { setImage(newValue, for: .selected) }
    }
    
    /// The image for highlighted state
    var imageForHighlighted: UIImage? {
        get { image(for: .highlighted) }
        set { setImage(newValue, for: .highlighted) }
    }
    
    /// The image for disabled state
    var imageForDisabled: UIImage? {
        get { image(for: .disabled) }
        set { setImage(newValue, for: .disabled) }
    }
    
    /// Title color for normal state
    var titleColorForNormal: UIColor? {
        get { titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal) }
    }
    
    /// Title color for selected state
    var titleColorForSelected: UIColor? {
        get { titleColor(for: .selected) }
        set { setTitleColor(newValue, for: .selected) }
    }

    /// Title color for highlighted state
    var titleColorForHighlighted: UIColor? {
        get { titleColor(for: .highlighted) }
        set { setTitleColor(newValue, for: .highlighted) }
    }
    
    /// Title color for disabled state
    var titleColorForDisabled: UIColor? {
        get { titleColor(for: .disabled) }
        set { setTitleColor(newValue, for: .disabled) }
    }
    
    /// Attributed title for normal state
    var attributedTitleForNormal: NSAttributedString? {
        get { attributedTitle(for: .normal) }
        set { setAttributedTitle(newValue, for: .normal) }
    }
    
    /// Attributed title for selected state
    var attributedTitleForSelected: NSAttributedString? {
        get { attributedTitle(for: .selected) }
        set { setAttributedTitle(newValue, for: .selected) }
    }
    
    /// Attributed title for highlighted state
    var attributedTitleForHighlighted: NSAttributedString? {
        get { attributedTitle(for: .highlighted) }
        set { setAttributedTitle(newValue, for: .highlighted) }
    }
    
    /// Attributed title for disabled state
    var attributedTitleForDisabled: NSAttributedString? {
        get { attributedTitle(for: .disabled) }
        set { setAttributedTitle(newValue, for: .disabled) }
    }
    
    /// Set the title to be displayed
    @discardableResult
    func setting(title: String?, for state: UIControl.State = []) -> UIButton {
        setTitle(title, for: state)
        return self
    }
    
    /// Set the color of the title
    @discardableResult
    func setting(titleColor: UIColor?, for state: UIControl.State = []) -> UIButton {
        setTitleColor(titleColor, for: state)
        return self
    }
    
    /// Set the color of the title
    @discardableResult
    func setting(titleShadowColor: UIColor?, for state: UIControl.State = []) -> UIButton {
        setTitleShadowColor(titleShadowColor, for: state)
        return self
    }
    
    /// Set image to be displayed
    @discardableResult
    func setting(image: UIImage?, for state: UIControl.State = []) -> UIButton {
        setImage(image, for: state)
        return self
    }
    
    /// Set background image to be displayed
    @discardableResult
    func setting(backgroundImage image: UIImage?, for state: UIControl.State = []) -> UIButton {
        setBackgroundImage(image, for: state)
        return self
    }
    
    /// Set the `attributed title` to be displayed
    @discardableResult
    func setting(attributedTitle title: NSAttributedString?, for state: UIControl.State = []) -> UIButton {
        setAttributedTitle(title, for: state)
        return self
    }
    
    /// Add an action of type (x-source-tag://anyAction)
    @discardableResult @inlinable
    func adding(_ action: AnyAction, for event: UIControl.Event = .touchUpInside) -> UIButton {
        addTarget(action, action: #selector(action.invoke), for: event)
        objc_setAssociatedObject(self, String(ObjectIdentifier(self).hashValue) + String(event.rawValue), action, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        return self
    }
    
    @available(iOS 14.0, *)
    /// Add a menu to the button.
    /// - Parameters:
    ///  - menu: An instance of UIMenu type.
    ///  - isPrimary: Boolean. Default is YES.
    /// - Returns: The receiver UIButton instance
    @discardableResult
    func menu(_ menu: UIMenu, showsMenuAsPrimaryAction isPrimary: Bool = true) -> UIButton {
        self.menu = menu
        showsMenuAsPrimaryAction = isPrimary
        return self
    }
    
    
    @available(iOS 14.0, *)
    @discardableResult
    /// Add a `UIAction` instance as action
    /// - Parameters:
    ///   - action: An instance of UIAction type
    ///   - event: The touch event to UIControl. Default is `UIControl.Event.touchUpInside`
    /// - Returns: The receiver UIButton instance
    func adding(_ action: UIAction, for event: UIControl.Event = .touchUpInside) -> UIButton {
        addAction(action, for: event)
        return self
    }
}
