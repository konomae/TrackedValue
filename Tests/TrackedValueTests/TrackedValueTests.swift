import XCTest
@testable import TrackedValue

final class TrackedValueTests: XCTestCase {
    func testInit() {
        let original = Bool.random()
        let v = TrackedValue(original)
        XCTAssertEqual(v.value, original)
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
