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

public extension UINavigationController {
    convenience init<Content>(@NavigationBuilder _ content: () -> Content) where Content: UIViewController {
        self.init(rootViewController: content())
    }
}

@resultBuilder
public
struct NavigationBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: UIViewController {
        content
    }
    
    public static func buildOptional<Content>(_ component: Content?) -> Content where Content: UIViewController {
        component ?? UIViewController() as! Content
    }
    
    public static func buildEither<Content>(first component: Content) -> Content where Content: UIViewController  {
        component
    }
    
    public static func buildEither<Content>(second component: Content) -> Content where Content: UIViewController {
        component
    }
    
    public static func buildLimitedAvailability<Content>(_ component: Content) -> Content where Content: UIViewController {
        component
    }
}
