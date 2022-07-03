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
    /// Initializes and returns a new stack view object that manages the provided views.
    /// - Parameters:
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - content: The list of views arranged by the stack view.
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .center, @StackViewBuilder content: () -> [UIView]) {
        self.init(arrangedSubviews: content())
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
    }
    
    /// Initializes and returns a new stack view object that manages the provided views.
    /// - Parameters:
    ///   - arrangedSubviews: The list of views arranged by the stack view.
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .center) {
            self.init(arrangedSubviews: arrangedSubviews)
            self.axis = axis
            self.spacing = spacing
            self.distribution = distribution
            self.alignment = alignment
        }
    
    @discardableResult
    /// Adds a view to the end of the arrangedSubviews array.
    /// - Parameter views: The list of views to be added.
    func add(arrangedSubviews views: [UIView]) -> UIStackView {
        views.forEach { addArrangedSubview($0) }
        return self
    }
    
    @discardableResult
    /// Adds a view to the index of the specified arrangedSubview.
    /// - Parameters:
    ///   - arrangedSubview: The view to be replaced
    ///   - newView: The view to be added.
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
