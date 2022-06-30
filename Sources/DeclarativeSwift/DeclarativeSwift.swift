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

public extension UIView {
  @discardableResult
  func enablingUserInteraction() -> UIView {
    isUserInteractionEnabled = true
    return self
  }
  
  @discardableResult
  func disablingUserInteraction() -> UIView {
    isUserInteractionEnabled = false
    return self
  }
  
  @discardableResult
  func tagging(_ tag: Int) -> UIView {
    self.tag = tag
    return self
  }
  
  @discardableResult
  func hiding(_ hidden: Bool) -> UIView {
    isHidden = hidden
    return self
  }
  
  @discardableResult
  func alpha(_ newValue: CGFloat) -> UIView {
    alpha = newValue
    return self
  }
  
  @discardableResult
  func isOpaque(_ newValue: Bool) -> UIView {
    isOpaque = newValue
    return self
  }
  
  @discardableResult
  func tinting(_ tintColor: UIColor?) -> UIView {
    self.tintColor = tintColor
    return self
  }
  
  @discardableResult
  func clipping(_ clips: Bool) -> UIView {
    clipsToBounds = clips
    return self
  }
  
  @discardableResult
  func masking(with aView: UIView?) -> UIView {
    mask = aView
    return self
  }
  
  @discardableResult
  func changing(frame: CGRect) -> UIView {
    self.frame = frame
    return self
  }
  
  @discardableResult
  func changing(bounds: CGRect) -> UIView {
    self.bounds = bounds
    return self
  }
  
  @discardableResult
  func centering(to newPoint: CGPoint) -> UIView {
    center = newPoint
    return self
  }
  
  @discardableResult
  func transforming(_ newTransform: CGAffineTransform) -> UIView {
    transform = newTransform
    return self
  }
  
  @available(iOSApplicationExtension 13.0, *)
  @discardableResult
  func transforming3D(_ newTransform: CATransform3D) -> UIView {
    transform3D = newTransform
    return self
  }
  
  @discardableResult
  func addingSubview(_ newSubView: UIView) -> UIView {
    addSubview(newSubView)
    return self
  }
  
  @discardableResult
  func bringingSubview(toFront aSubView: UIView) -> UIView {
    bringSubviewToFront(aSubView)
    return self
  }
  
  @discardableResult
  func sendingSubview(toBack aSubView: UIView) -> UIView {
    sendSubviewToBack(aSubView)
    return self
  }
  
  @discardableResult
  func insertingSubview(_ aView: UIView, at index: Int) -> UIView {
    insertSubview(aView, at: index)
    return self
  }
  
  @discardableResult
  func insertingSubview(_ aView: UIView, aboveSubview: UIView) -> UIView {
    insertSubview(aView, aboveSubview: aboveSubview)
    return self
  }
  
  @discardableResult
  func insertingSubview(_ aView: UIView, belowSubview: UIView) -> UIView {
    insertSubview(aView, belowSubview: belowSubview)
    return self
  }
  
  @discardableResult
  func exchangingSubview(at vIndex: Int, withSubviewAt svIndex: Int) -> UIView {
    exchangeSubview(at: vIndex, withSubviewAt: svIndex)
    return self
  }
  
  @discardableResult
  func changingBackgroundColor(to newColor: UIColor?) -> UIView {
    backgroundColor = newColor
    return self
  }
  
  @discardableResult
  func roundingCorners(by value: CGFloat, smoothingCurves smooths: Bool) -> UIView {
    layer.cornerRadius = value
    if smooths {
      if #available(iOSApplicationExtension 13.0, *) {
        layer.cornerCurve = .continuous
      }
    }
    return self
  }
  
  @available(iOSApplicationExtension 11.0, *)
  @discardableResult
  func addingInteraction(_ interaction: UIInteraction) -> UIView {
    addInteraction(interaction)
    return self
  }
  
  @available(iOSApplicationExtension 11.0, *)
  @discardableResult
  func removingInteraction(_ interaction: UIInteraction) -> UIView {
    removeInteraction(interaction)
    return self
  }
  
  @discardableResult
  func addingShadow(path: UIBezierPath, color: UIColor = .black, offset: CGSize = .zero, radius: CGFloat, opacity: Float) -> UIView {
    layer.shadowPath = path.cgPath
    layer.shadowColor = color.cgColor
    layer.shadowOffset = offset
    layer.shadowRadius = radius
    layer.opacity = opacity
    return self
  }
}

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
}

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
}

public extension UIImageView {
  @discardableResult
  func setting(image i: UIImage) -> UIImageView {
    image = i
    return self
  }
  @discardableResult
  func settingAnimation(image i: [UIImage], duration d: TimeInterval, repeatCount rc: Int = 0) -> UIImageView {
    animationImages = i
    animationDuration = d
    animationRepeatCount = rc
    return self
  }
}
