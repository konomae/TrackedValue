import XCTest
@testable import TrackedValue

final class TrackedValueTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TrackedValue().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
