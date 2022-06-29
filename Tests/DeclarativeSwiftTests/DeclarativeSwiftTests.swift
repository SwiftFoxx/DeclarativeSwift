import XCTest
@testable import DeclarativeSwift

final class DeclarativeSwiftTests: XCTestCase {
    func testUIButton() throws {
        var aButton = UIButton()
        XCTAssertEqual(aButton.titleLabel?.text, nil)
        aButton = UIButton()
            .setting(title: "Action Button", for: [])
            .adding(AnyAction({
                print("Hello world")
            }))
        XCTAssertNotEqual(aButton.titleLabel?.text, nil)
        XCTAssertEqual(aButton.titleLabel?.text, "Action Button")
    }
}
