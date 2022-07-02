// Copyright 2022 SwiftFoxx

import XCTest
@testable import DeclarativeSwift

final class UILabelTests: XCTestCase {
    func testInitializer() throws {
        let label = UILabel(text: "Here is some text", textStyle: .footnote)
        XCTAssertNotNil(label.text)
        XCTAssertEqual(label.text, "Here is some text")
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: .footnote))
    }
    
    func testAttributedString() throws {
        let label = UILabel()
        XCTAssertNil(label.text)
        label
            .settingText("Some text to apply attributes")
            .settingFont(.systemFont(ofSize: 16))
            .attribute(textIn: label.text?.range(of: "attributes"), [.foregroundColor : UIColor.systemPurple])
        XCTAssertNotNil(label.text)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 16))
        XCTAssertNotNil(label.attributedText)
    }
}
