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

public extension Array {
    func elementAt(index: Int) -> Element? {
        guard index < count else { return nil }
        return self[index]
    }
    
    mutating func prepend(_ element: Element) {
        insert(element, at: 0)
    }
    
    init?(unsafeData: Data) {
        guard unsafeData.count % MemoryLayout<Element>.stride == 0 else { return nil }
        #if swift(>=5.0)
        self = unsafeData.withUnsafeBytes { .init($0.bindMemory(to: Element.self)) }
        #else
        self = unsafeData.withUnsafeBytes {
            .init(UnsafeBufferPointer<Element>(
                start: $0,
                count: unsafeData.count / MemoryLayout<Element>.stride
            ))
        }
        #endif
    }
}

public extension Array where Element: Comparable, Element: Hashable {
    func removeingDuplicate(_ ascending: Bool = true) -> Array {
        let aSet = Set(self)
        var result = Array(aSet)
        if ascending {
            result = result.sorted(by: <)
        } else {
            result = result.sorted(by: >)
        }
        return result
    }
    
    @available(iOS 15.0, *)
    func removeingDuplicate(_ order: SortOrder = .forward) -> Array {
        let aSet = Set(self)
        var result = Array(aSet)
        if order == .forward {
            result = result.sorted(by: { $0 < $1 })
        } else {
            result = result.sorted(by: { $0 > $1 })
        }
        return result
    }
}

public extension Array where Element: UIView {
    func viewWithTag(_ tag: Int) -> UIView? {
        first(where: { $0.tag == tag })
    }
    
    func firstResponder() -> UIView? {
        first(where: { $0.isFirstResponder })
    }
}
