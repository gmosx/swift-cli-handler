import XCTest

import CLIHandlerTests

var tests = [XCTestCaseEntry]()
tests += CLIHandlerTests.allTests()
XCTMain(tests)