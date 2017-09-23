//
//  DateTests.swift
//  Date
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import DateTests

extension DateTests {

	static var allTests : [(String, (DateTests) -> () throws -> Void)] {
		return [
			("testDay", testDay),
			("testDayTime", testDayTime),
			("testIntValue", testIntValue),
			("testMonth", testMonth),
		]
	}

}

XCTMain([
	testCase(DateTests.allTests),
])

