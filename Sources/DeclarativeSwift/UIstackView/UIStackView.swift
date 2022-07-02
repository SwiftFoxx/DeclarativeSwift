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

extension UIStackView {
    /// Returns a new stack view object that manages the provided views.
    /// - Parameters:
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - content: The list of views arranged by the stack view.
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .center, @StackBuilder content: () -> [UIView]) {
        self.init(arrangedSubviews: content())
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - arrangedSubviews: <#arrangedSubviews description#>
    ///   - axis: <#axis description#>
    ///   - spacing: <#spacing description#>
    ///   - alignment: <#alignment description#>
    ///   - distribution: <#distribution description#>
    convenience init( arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0.0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {
            self.init(arrangedSubviews: arrangedSubviews)
            self.axis = axis
            self.spacing = spacing
            self.alignment = alignment
            self.distribution = distribution
        }
    
    @discardableResult
    /// <#Description#>
    /// - Parameter views: <#views description#>
    /// - Returns: <#description#>
    func add(arrangedSubviews views: [UIView]) -> UIStackView {
        views.forEach { addArrangedSubview($0) }
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - arrangedSubview: <#arrangedSubview description#>
    ///   - newView: <#newView description#>
    /// - Returns: <#description#>
    func replace(arrangedSubview: UIView, with newView: UIView) -> UIStackView {
        guard let viewIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
            NSException(name: .undefinedKeyException, reason: "The query view was not found in arrangedSubviews").raise()
            return self
        }
        removeArrangedSubview(arrangedSubview)
        insertArrangedSubview(newView, at: viewIndex)
        return self
    }
}
