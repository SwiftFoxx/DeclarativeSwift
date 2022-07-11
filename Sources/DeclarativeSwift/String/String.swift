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

public extension String {
    /// Returns a new string made by removing characters contained in a given character set from both ends of the String.
    /// - Parameter set: The character set to be removed.
    func trimmed(in set: CharacterSet = .whitespacesAndNewlines) -> String {
        trimmingCharacters(in: set)
    }
    
    private static var textChecker = UITextChecker()
    
    /// Initiates a search of a range of a string for a misspelled word.
    /// - Returns: The range of the first misspelled word encountered or {NSNotFound, 0} if none is found.
    func misSpelledRange() -> NSRange {
        let checker = Self.textChecker
        let range = NSRange(startIndex..<endIndex, in: self)
        return checker.rangeOfMisspelledWord(
            in: self,
            range: range,
            startingAt: 0,
            wrap: false,
            language: Locale.preferredLanguages.first ?? "en"
        )
    }
    
    /// <#Description#>
    /// - Parameter range: <#range description#>
    /// - Returns: <#description#>
    func guesses(forWordRange range: Range<String.Index>?) -> [String] {
        guard let range = range else { return [] }
        let checker = Self.textChecker
        return checker.guesses(
            forWordRange: NSRange(range, in: self),
            in: self,
            language: Locale.preferredLanguages.first ?? "en"
        ) ?? []
    }
    
    /// <#Description#>
    /// - Parameter range: <#range description#>
    /// - Returns: <#description#>
    func completions(forPartialWordRange range: Range<String.Index>?) -> [String] {
        guard let range = range else { return [] }
        let checker = Self.textChecker
        return checker.guesses(
            forWordRange: NSRange(range, in: self),
            in: self,
            language: Locale.preferredLanguages.first ?? "en"
        ) ?? []
    }
    
    
}

@propertyWrapper
/// Treats any String (String or String?) in a way that the result (`wrappedValue`) is never optional or nil.
struct NonNil {
    private var _originalValue: String?
    
    var wrappedValue: String {
        get {
            _originalValue ?? ""
        }
        set {
            _originalValue = newValue
        }
    }
}
