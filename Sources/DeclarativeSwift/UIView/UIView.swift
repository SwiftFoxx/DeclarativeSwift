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
    /// Enables User Interaction on the receiver.
    func enablingUserInteraction() -> UIView {
        isUserInteractionEnabled = true
        return self
    }
    
    @discardableResult
    /// Disables User Interaction on the receiver.
    func disablingUserInteraction() -> UIView {
        isUserInteractionEnabled = false
        return self
    }
    
    @discardableResult
    /// Adds a tag to the receiver.
    /// - Parameter tag: The tag of type `Int`
    func tagging(_ tag: Int) -> UIView {
        self.tag = tag
        return self
    }
    
    @discardableResult
    /// Sets the `isHidden` property on the receiver.
    /// - Parameter hidden: Value of type Boolean.
    func hiding(_ hidden: Bool) -> UIView {
        isHidden = hidden
        return self
    }
    
    @discardableResult
    /// Sets the `alpha` value on the receiver.
    /// - Parameter newValue: Value of type CGFloat
    func alpha(_ newValue: CGFloat) -> UIView {
        alpha = newValue
        return self
    }
    
    @discardableResult
    /// Sets the opaqueness of the receiver.
    /// - Parameter newValue: Value of type Boolean.
    func isOpaque(_ newValue: Bool) -> UIView {
        isOpaque = newValue
        return self
    }
    
    @discardableResult
    /// Sets the tint color of the receiver.
    /// - Parameter tintColor: Value of type UIColor.
    func tinting(_ tintColor: UIColor?) -> UIView {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    /// Sets the `clipsToBounds` property of the receiver.
    /// - Parameter clips: Value of type Boolean.
    func clipping(_ clips: Bool) -> UIView {
        clipsToBounds = clips
        return self
    }
    
    @discardableResult
    /// Sets a mask whose alpha channel is used for visibility of the receiver.
    /// - Parameter aView: A view to set as the mask.
    func masking(with aView: UIView?) -> UIView {
        mask = aView
        return self
    }
    
    @discardableResult
    /// Changes the frame of the receiver.
    /// The receiver must use auto resizing for this to work. For auto layout, this method won't work.
    /// - Parameter frame: The final frame of the view. Value of type CGRect.
    func changing(frame: CGRect) -> UIView {
        guard translatesAutoresizingMaskIntoConstraints else { return self }
        self.frame = frame
        return self
    }
    
    @discardableResult
    /// Changes the bounds of the receiver.
    /// The receiver must use auto resizing for this to work. For auto layout, this method won't work.
    /// - Parameter bounds: The final bounds of the view. Value of type CGRect.
    func changing(bounds: CGRect) -> UIView {
        guard translatesAutoresizingMaskIntoConstraints else { return self }
        self.bounds = bounds
        return self
    }
    
    @discardableResult
    /// Centers the receiver to the provided `CGPoint`.
    /// The receiver must use auto resizing for this to work. For auto layout, this method won't work.
    /// - Parameter newPoint: The destination center. Value of type `CGPoint`
    func centering(to newPoint: CGPoint) -> UIView {
        center = newPoint
        return self
    }
    
    @discardableResult
    /// Applies a transform to the receiver.
    /// - Parameter newTransform: Value of type `CGAffineTransform`
    func transforming(_ newTransform: CGAffineTransform) -> UIView {
        transform = newTransform
        return self
    }
    
    @available(iOSApplicationExtension 13.0, *)
    @discardableResult
    /// Applies a three-dimensional transform to the receiver.
    /// - Parameter newTransform: The three-dimensional transform to apply to the view.
    func transforming3D(_ newTransform: CATransform3D) -> UIView {
        transform3D = newTransform
        return self
    }
    
    @discardableResult
    /// Adds a view to the end of the receiver’s list of subviews.
    /// - Parameter newSubView: The view to be added. After being added, this view appears on top of any other subviews.
    func addingSubview(_ newSubView: UIView) -> UIView {
        addSubview(newSubView)
        return self
    }
    
    @discardableResult
    /// Moves the specified subview so that it appears on top of its siblings.
    /// - Parameter aSubView: The subview to move to the front.
    func bringingSubview(toFront aSubView: UIView) -> UIView {
        bringSubviewToFront(aSubView)
        return self
    }
    
    @discardableResult
    /// Moves the specified subview so that it appears behind its siblings.
    /// - Parameter aSubView: The subview to move to the back.
    func sendingSubview(toBack aSubView: UIView) -> UIView {
        sendSubviewToBack(aSubView)
        return self
    }
    
    @discardableResult
    /// Inserts a subview at the specified index.
    /// - Parameters:
    ///   - aView: The view to insert. This value cannot be nil.
    ///   - index: The index in the array of the subviews property at which to insert the view.
    func insertingSubview(_ aView: UIView, at index: Int) -> UIView {
        insertSubview(aView, at: index)
        return self
    }
    
    @discardableResult
    /// Inserts a view above another view in the view hierarchy.
    /// - Parameters:
    ///   - aView: The view to insert.
    ///   - aboveSubview: The sibling view that will be behind the inserted view.
    func insertingSubview(_ aView: UIView, aboveSubview: UIView) -> UIView {
        insertSubview(aView, aboveSubview: aboveSubview)
        return self
    }
    
    @discardableResult
    /// Inserts a view below another view in the view hierarchy.
    /// - Parameters:
    ///   - aView: The view to insert below another view.
    ///   - belowSubview: The sibling view that will be above the inserted view.
    func insertingSubview(_ aView: UIView, belowSubview: UIView) -> UIView {
        insertSubview(aView, belowSubview: belowSubview)
        return self
    }
    
    @discardableResult
    /// Exchanges the subviews at the specified indices.
    /// - Parameters:
    ///   - vIndex: The index of the first subview in the receiver.
    ///   - svIndex: The index of the second subview in the receiver.
    func exchangingSubview(at vIndex: Int, withSubviewAt svIndex: Int) -> UIView {
        exchangeSubview(at: vIndex, withSubviewAt: svIndex)
        return self
    }
    
    @discardableResult
    /// Removes a specified subview.
    /// - Parameter view: The sub view to be removed.
    func removing(subView view: UIView) -> UIView {
        guard subviews.contains(view) else { return self }
        view.removeFromSuperview()
        return self
    }
    
    @discardableResult
    /// Removes all of the sub views that this view has.
    func removingAllSubViews() -> UIView {
        subviews.forEach { $0.removeFromSuperview() }
        return self
    }
    
    @discardableResult
    /// Changes the view’s background color.
    /// - Parameter newColor: Value of type `UIColor`
    func changingBackgroundColor(to newColor: UIColor?) -> UIView {
        backgroundColor = newColor
        return self
    }
    
    @discardableResult
    /// Draws rounded corner for the layer's background.
    /// - Parameters:
    ///   - value: The radius to use when drawing rounded corners for the layer’s background.
    ///   - smooths: Value of type `Bool`. When YES, the corner curves are smoother.
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
    /// Adds an interaction to the view.
    /// - Parameter interaction: The interaction object to add to the view.
    func addingInteraction(_ interaction: UIInteraction) -> UIView {
        addInteraction(interaction)
        return self
    }
    
    @available(iOSApplicationExtension 11.0, *)
    @discardableResult
    /// Removes an interaction from the view.
    /// - Parameter interaction: The interaction object to remove from the view.
    func removingInteraction(_ interaction: UIInteraction) -> UIView {
        removeInteraction(interaction)
        return self
    }
    
    @discardableResult
    /// Adds shadow to the view's layer.
    func addingShadow(path: UIBezierPath, color: UIColor = .black, offset: CGSize = .zero, radius: CGFloat, opacity: Float) -> UIView {
        layer.shadowPath = path.cgPath
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.opacity = opacity
        return self
    }
    
    @discardableResult
    /// Adds shadow to the view's layer
    /// - Parameter shadow: A closure type that takes the properties of (x-source-tag://Shadow)[Shadow]
    func addingShadow(@ShadowBuilder _ shadow: () -> Shadow) -> UIView {
        layer.shadowPath = shadow().shadowPath?.cgPath
        layer.shadowColor = shadow().shadowColor?.cgColor
        layer.shadowOffset = shadow().shadowOffset
        layer.shadowRadius = shadow().shadowRadius
        layer.opacity = shadow().opacity
        return self
    }
    
    @discardableResult
    /// Draws border on the view's layer with specified color and width.
    /// - Parameters:
    ///   - color: The border color.
    ///   - width: The width of the border. Default is 1.
    func addingBorder(color: UIColor, borderWidth width: CGFloat = 1) -> UIView {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    /// The view controller that has the view embedded.
    var viewController: UIViewController? {
        weak var superResponder: UIResponder? = self
        while superResponder != nil {
            superResponder = superResponder!.next
            if let viewController = superResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    
}
