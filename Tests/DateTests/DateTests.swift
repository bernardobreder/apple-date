import XCTest
@testable import Date

class DateTests: XCTestCase {
    
    override func setUp() {
        GMT.timezoneUTC()
        GMT.localePtBR()
    }
    
    func testDay() {
        let day = Day(day: 1, month: 2, year: 2017)
        XCTAssertEqual(1, day.day)
        XCTAssertEqual(2, day.month)
        XCTAssertEqual(2017, day.year)
        XCTAssertTrue(day == Day(day: 1, month: 2, year: 2017))
        XCTAssertFalse(day == Day(day: 2, month: 2, year: 2017))
        XCTAssertFalse(day == Day(day: 1, month: 3, year: 2017))
        XCTAssertFalse(day == Day(day: 1, month: 2, year: 2018))
        XCTAssertTrue(day.hashValue != 0)
        XCTAssertEqual(1, day.components.day)
        XCTAssertEqual(2, day.components.month)
        XCTAssertEqual(2017, day.components.year)
    }

    func testMonth() {
        let month = Month(month: 2, year: 2017)
        XCTAssertEqual(2017, month.year)
        XCTAssertEqual(2, month.month)
        XCTAssertTrue(month == Month(month: 2, year: 2017))
        XCTAssertFalse(month == Month(month: 1, year: 2017))
        XCTAssertFalse(month == Month(month: 2, year: 2018))
        XCTAssertTrue(month.hashValue != 0)
        XCTAssertEqual(2, month.components.month)
        XCTAssertEqual(2017, month.components.year)
    }

    func testDayTime() {
        let daytime = DayTime(day: 1, month: 2, year: 2017, hour: 13, minute: 10, second: 5)
        XCTAssertEqual(2017, daytime.year)
        XCTAssertEqual(2, daytime.month)
        XCTAssertEqual(1, daytime.day)
        XCTAssertEqual(13, daytime.hour)
        XCTAssertEqual(10, daytime.minute)
        XCTAssertEqual(5, daytime.second)
        XCTAssertTrue(daytime == DayTime(day: 1, month: 2, year: 2017, hour: 13, minute: 10, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 3, month: 2, year: 2017, hour: 13, minute: 10, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 1, month: 3, year: 2017, hour: 13, minute: 10, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 1, month: 2, year: 2018, hour: 13, minute: 10, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 1, month: 2, year: 2017, hour: 14, minute: 10, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 1, month: 2, year: 2017, hour: 13, minute: 11, second: 5))
        XCTAssertFalse(daytime == DayTime(day: 1, month: 2, year: 2017, hour: 13, minute: 10, second: 6))
        XCTAssertTrue(daytime.hashValue != 0)
        XCTAssertEqual(1, daytime.components.day)
        XCTAssertEqual(2, daytime.components.month)
        XCTAssertEqual(2017, daytime.components.year)
        XCTAssertEqual("", daytime.format(date: .none, time: .none))
        XCTAssertEqual("13:10", daytime.format(date: .none, time: .short))
        XCTAssertEqual("13:10:05", daytime.format(date: .none, time: .medium))
        XCTAssertEqual("13:10:05 GMT", daytime.format(date: .none, time: .long))
        XCTAssertEqual("13:10:05 GMT", daytime.format(date: .none, time: .full))
        XCTAssertEqual("01/02/17", daytime.format(date: .short, time: .none))
        XCTAssertEqual("01/02/17 13:10", daytime.format(date: .short, time: .short))
        XCTAssertEqual("01/02/17 13:10:05", daytime.format(date: .short, time: .medium))
        XCTAssertEqual("01/02/17 13:10:05 GMT", daytime.format(date: .short, time: .long))
        XCTAssertEqual("01/02/17 13:10:05 GMT", daytime.format(date: .short, time: .full))
        XCTAssertEqual("1 de fev de 2017", daytime.format(date: .medium, time: .none))
        XCTAssertEqual("1 de fev de 2017 13:10", daytime.format(date: .medium, time: .short))
        XCTAssertEqual("1 de fev de 2017 13:10:05", daytime.format(date: .medium, time: .medium))
        XCTAssertEqual("1 de fev de 2017 13:10:05 GMT", daytime.format(date: .medium, time: .long))
        XCTAssertEqual("1 de fev de 2017 13:10:05 GMT", daytime.format(date: .medium, time: .full))
        XCTAssertEqual("1 de fevereiro de 2017", daytime.format(date: .long, time: .none))
        XCTAssertEqual("1 de fevereiro de 2017 13:10", daytime.format(date: .long, time: .short))
        XCTAssertEqual("1 de fevereiro de 2017 13:10:05", daytime.format(date: .long, time: .medium))
        XCTAssertEqual("1 de fevereiro de 2017 13:10:05 GMT", daytime.format(date: .long, time: .long))
        XCTAssertEqual("1 de fevereiro de 2017 13:10:05 GMT", daytime.format(date: .long, time: .full))
        XCTAssertEqual("quarta-feira, 1 de fevereiro de 2017", daytime.format(date: .full, time: .none))
        XCTAssertEqual("quarta-feira, 1 de fevereiro de 2017 13:10", daytime.format(date: .full, time: .short))
        XCTAssertEqual("quarta-feira, 1 de fevereiro de 2017 13:10:05", daytime.format(date: .full, time: .medium))
        XCTAssertEqual("quarta-feira, 1 de fevereiro de 2017 13:10:05 GMT", daytime.format(date: .full, time: .long))
        XCTAssertEqual("quarta-feira, 1 de fevereiro de 2017 13:10:05 GMT", daytime.format(date: .full, time: .full))
    }
    
    func testIntValue() {
        XCTAssertEqual(20170201, Day(day: 1, month: 2, year: 2017).intValue)
        XCTAssertEqual(Day(day: 1, month: 2, year: 2017), Day(intValue: Day(day: 1, month: 2, year: 2017).intValue))
        XCTAssertTrue(Day(day: 1, month: 1, year: 2017).intValue < Day(day: 1, month: 2, year: 2017).intValue)
        XCTAssertTrue(Day(day: 1, month: 2, year: 2017).intValue > Day(day: 1, month: 1, year: 2017).intValue)
        XCTAssertEqual(201702, Month(month: 2, year: 2017).intValue)
        XCTAssertEqual(Month(month: 2, year: 2017), Month(intValue: Month(month: 2, year: 2017).intValue))
        XCTAssertTrue(Month(month: 1, year: 2017).intValue < Month(month: 2, year: 2017).intValue)
        XCTAssertTrue(Month(month: 2, year: 2017).intValue > Month(month: 1, year: 2017).intValue)
        XCTAssertEqual(DayTime(day: 31, month: 12, year: 9999, hour: 23, minute: 59, second: 59), DayTime(intValue: DayTime(day: 31, month: 12, year: 9999, hour: 23, minute: 59, second: 59).intValue))
        XCTAssertTrue(DayTime(day: 1, month: 2, year: 2017, hour: 13, minute: 10, second: 5).intValue < DayTime(day: 2, month: 2, year: 2017, hour: 13, minute: 10, second: 5).intValue)
        XCTAssertTrue(DayTime(day: 2, month: 2, year: 2017, hour: 13, minute: 10, second: 5).intValue > DayTime(day: 1, month: 1, year: 2017, hour: 13, minute: 10, second: 5).intValue)
    }

}
