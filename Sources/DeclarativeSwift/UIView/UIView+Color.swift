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

public class Color: NSObject, ViewBackgroundConvertible {
    
    public static var black = UIColor.black
    public static var darkGray = UIColor.darkGray
    public static var lightGray = UIColor.lightGray
    public static var white = UIColor.white
    public static var gray = UIColor.gray
    public static var red = UIColor.red
    public static var green = UIColor.green
    public static var blue = UIColor.blue
    public static var cyan = UIColor.cyan
    public static var yellow = UIColor.yellow
    public static var magenta = UIColor.magenta
    public static var orange = UIColor.orange
    public static var purple = UIColor.purple
    public static var brown = UIColor.brown
    public static var clear = UIColor.clear
    
    public static var systemRed = UIColor.systemRed
    public static var systemGreen = UIColor.systemGreen
    public static var systemBlue = UIColor.systemBlue
    public static var systemOrange = UIColor.systemOrange
    public static var systemYellow = UIColor.systemYellow
    public static var systemPink = UIColor.systemPink
    public static var systemPurple = UIColor.systemPurple
    public static var systemTeal = UIColor.systemTeal
    public static var systemIndigo = UIColor.systemIndigo
    public static var systemBrown = UIColor.systemBrown
    @available(iOS 15.0, *)
    public static var systemMint = UIColor.systemMint
    @available(iOS 15.0, *)
    public static var systemCyan = UIColor.systemCyan
    public static var systemGray = UIColor.systemGray
    public static var systemGray2 = UIColor.systemGray2
    public static var systemGray3 = UIColor.systemGray3
    public static var systemGray4 = UIColor.systemGray4
    public static var systemGray5 = UIColor.systemGray5
    public static var systemGray6 = UIColor.systemGray6
    public static var label = UIColor.label
    public static var secondaryLabel = UIColor.secondaryLabel
    public static var tertiaryLabel = UIColor.tertiaryLabel
    public static var quaternaryLabel = UIColor.quaternaryLabel
    public static var link = UIColor.link
    public static var placeholderText = UIColor.placeholderText
    public static var separator = UIColor.separator
    public static var opaqueSeparator = UIColor.opaqueSeparator
    public static var systemBackground = UIColor.systemBackground
    public static var secondarySystemBackground = UIColor.secondarySystemBackground
    public static var tertiarySystemBackground = UIColor.tertiarySystemBackground
    public static var systemGroupedBackground = UIColor.systemGroupedBackground
    public static var secondarySystemGroupedBackground = UIColor.secondarySystemGroupedBackground
    public static var tertiarySystemGroupedBackground = UIColor.tertiarySystemGroupedBackground
    public static var systemFill = UIColor.systemFill
    public static var secondarySystemFill = UIColor.secondarySystemFill
    public static var tertiarySystemFill = UIColor.tertiarySystemFill
    public static var quaternarySystemFill = UIColor.quaternarySystemFill
    public static var lightText = UIColor.lightText
    public static var darkText = UIColor.darkText
    @available(iOS, introduced: 2.0, deprecated: 13.0)
    public static var groupTableViewBackground = UIColor.groupTableViewBackground
    
    public var needsEmbedding: Bool {
        false
    }
    
    public var `class`: String {
        "Color"
    }
}

extension UIColor: ViewBackgroundConvertible {
    public var needsEmbedding: Bool {
        false
    }
    
    public var `class`: String {
        "UIColor"
    }
    
    
}
