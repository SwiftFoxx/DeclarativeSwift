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
