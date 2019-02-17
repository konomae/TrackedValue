import XCTest
@testable import TrackedValue

final class TrackedValueTests: XCTestCase {
    func testInit() {
        let original = Bool.random()
        let v = TrackedValue(original)
        XCTAssertEqual(v.value, original)
    }

    func testEqual() {
        let v1 = TrackedValue(Bool.random())
        let v2 = v1
        XCTAssertEqual(v1, v2)
    }

    func testEqualWhenValueModifiedWithDifferentValue() {
        var v1 = TrackedValue(1)
        var v2 = v1

        v1.value = 2
        XCTAssertNotEqual(v1, v2)

        v2.value = 3
        XCTAssertNotEqual(v1, v2)
    }

    func testEqualWhenValueModifiedWithSameValue() {
        var v1 = TrackedValue(1)
        var v2 = v1

        v1.value = 1
        XCTAssertNotEqual(v1, v2)

        v2.value = 1
        XCTAssertNotEqual(v1, v2)
    }

    static var allTests = [
        ("testInit", testInit),
        ("testEqual", testEqual),
        ("testEqualWhenValueModifiedWithDifferentValue", testEqualWhenValueModifiedWithDifferentValue),
        ("testEqualWhenValueModifiedWithSameValue", testEqualWhenValueModifiedWithSameValue),
    ]
}
