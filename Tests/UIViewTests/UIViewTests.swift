// Copyright 2022 SwiftFoxx

import XCTest
@testable import DeclarativeSwift

final class UIViewTests: XCTestCase {
    func testEmbedding() throws {
        let aSuperView = UIView().changingBackgroundColor(to: .systemOrange)
        let aView = UIView()
            .changingBackgroundColor(to: .systemTeal)
            .embedding(in: aSuperView)
        XCTAssertFalse(aSuperView.subviews.isEmpty)
        XCTAssertFalse(aView.superview == nil)
    }
    
    func testBackgroundFunctionality() {
        let aView = UIView(
            frame: CGRect(
                origin: .zero,
                size: CGSize(
                    width: 200,
                    height: 50
                )
            )
        )
            .background { _ in
                Color.systemBlue
            }
            .roundingCorners(by: 24)
        XCTAssertNotEqual(aView.backgroundColor, nil)
        XCTAssertEqual(aView.layer.cornerRadius, 24)
    }
}
