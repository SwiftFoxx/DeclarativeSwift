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

public extension UIViewController {
    @discardableResult
    /// <#Description#>
    func onKeyboardShow(_ perform: @escaping @Sendable (_ endKeyboardFrame: CGRect) -> Void) -> UIViewController {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main) { [weak self] notification in
                guard
                    self != nil,
                    let userInfo = notification.userInfo,
                    let beginKeyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
                    let endKeyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                    endKeyboardFrame != beginKeyboardFrame
                else {
                    return
                }
                perform(endKeyboardFrame)
                NotificationCenter.default.removeObserver(self!, name: UIResponder.keyboardWillShowNotification, object: nil)
            }
        return self
    }
    
    @discardableResult
    /// <#Description#>
    func onKeyboardHide(_ perform: @escaping @Sendable () -> Void) -> UIViewController {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main) { [weak self] notification in
                guard self != nil else { return }
                perform()
                NotificationCenter.default.removeObserver(self!, name: UIResponder.keyboardWillHideNotification, object: nil)
            }
        return self
    }
    
    @discardableResult
    /// <#Description#>
    func onKeyboardFrameChange(_ perform: @escaping @Sendable (_ newFrame: CGRect) -> Void) -> UIViewController {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: .main) { [weak self] notification in
                guard
                    self != nil,
                    let userInfo = notification.userInfo,
                    let beginKeyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
                    let endKeyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                    endKeyboardFrame != beginKeyboardFrame
                else {
                    return
                }
                perform(endKeyboardFrame)
                NotificationCenter.default.removeObserver(self!, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
            }
        return self
    }
    
    @discardableResult
    /// <#Description#>
    func onViewLoad(_ execute: @escaping @Sendable () -> Void) -> UIViewController {
        var observer: NSKeyValueObservation?
        observer = observe(\.isViewLoaded, options: [.new]) { _, change in
            execute()
            observer?.invalidate()
            observer = nil
        }
        return self
    }
    
    @discardableResult
    func alert(title: String?, message: String? = nil, isPresented: Bindable<Bool>, _ components: () -> [UIAlertAction]) -> UIViewController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        components().forEach { component in
            alertController
                .addAction(
                    component
                )
        }
        isPresented.bind { [self] newValue in
            if newValue ?? false {
                present(alertController, animated: true)
            } else {
                alertController.dismiss(animated: true)
            }
        }
        return self
    }
}
