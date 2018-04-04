import XCTest
@testable import CLIHandler

final class CLIHandlerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CLIHandler().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
