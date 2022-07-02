// Copyright 2022 SwiftFoxx

import XCTest
@testable import DeclarativeSwift

final class UIStackViewTests: XCTestCase {
    func testInitializer() throws {
        let stackView = UIStackView(axis: .vertical) {
            UILabel(text: "Sample1")
            UILabel(text: "Sample2")
            UILabel(text: "Sample3")
            UILabel(text: "Sample4")
            UITextField()
        }
        XCTAssertFalse(stackView.axis == .horizontal)
        XCTAssertTrue(stackView.arrangedSubviews.count > 0)
        XCTAssertTrue(stackView.arrangedSubviews.contains(where: { $0 is UITextField }))
    }
}
