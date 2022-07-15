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

public extension UIAlertController {
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - viewController: <#viewController description#>
    ///   - animated: <#animated description#>
    ///   - completion: <#completion description#>
    func show(on viewController: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {
        var presentingViewController: UIViewController?
        if let viewController = viewController {
            presentingViewController = viewController
        } else {
            let window = UIWindow.keyWindow
            presentingViewController = window?.rootViewController
        }
        guard let presentingViewController = presentingViewController else {
            NSLog("Could not locate key window")
            return self
        }
        presentingViewController.present(self, animated: animated, completion: completion)
        return self
    }
    
    @discardableResult
    /// <#Description#>
    /// - Parameters:
    ///   - viewController: <#viewController description#>
    ///   - animated: <#animated description#>
    ///   - isPresented: <#isPresented description#>
    ///   - completion: <#completion description#>
    func show(on viewController: UIViewController? = nil, animated: Bool = true, isPresented: Bindable<Bool>, completion: (() -> Void)? = nil) -> UIAlertController {
        var presentingViewController: UIViewController?
        if let viewController = viewController {
            presentingViewController = viewController
        } else {
            let window = UIWindow.keyWindow
            presentingViewController = window?.rootViewController
        }
        guard let presentingViewController = presentingViewController else {
            NSLog("Could not locate key window")
            return self
        }
        isPresented.bind { newValue in
            if newValue ?? false {
                presentingViewController.present(self, animated: animated, completion: completion)
            } else {
                self.dismiss(animated: animated)
            }
        }
        return self
    }
}
