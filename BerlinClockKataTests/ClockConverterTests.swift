import XCTest
@testable import BerlinClockKata

class ClockConverterTests: XCTestCase {
    var sut: ClockConverter!

    override func setUpWithError() throws {
        sut = ClockConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSingleMinutesWithZeroValue() {
        let zeroDate = makeDateWithTime(hours: 0, minutes: 0, seconds: 0)
        let singleMinutes = sut.singleMinutes(for: zeroDate)
        XCTAssertEqual(singleMinutes, "OOOO")
    }
    
    func testSingleMinutesWithNonZeroValues() {
        let testDates = [
            makeDateWithTime(hours: 23, minutes: 59, seconds: 59),
            makeDateWithTime(hours: 12, minutes: 32, seconds: 0),
            makeDateWithTime(hours: 12, minutes: 34, seconds: 0),
            makeDateWithTime(hours: 12, minutes: 35, seconds: 0),
        ]
        
        let singleMinuteValues = testDates.map {
            sut.singleMinutes(for: $0)
        }
        
        let expectedOutputs = [
            "YYYY",
            "YYOO",
            "YYYY",
            "OOOO",
        ]
        
        for (actualOutput, expectedOutput) in zip(singleMinuteValues, expectedOutputs) {
            XCTAssertEqual(actualOutput, expectedOutput)
        }
    }
    
    func testFiveMinutesWithZeroValue() {
        let zeroDate = makeDateWithTime(hours: 0, minutes: 0, seconds: 0)
        let fiveMinutes = sut.fiveMinutes(for: zeroDate)
        XCTAssertEqual(fiveMinutes, "OOOOOOOOOOO")
    }
    
    func testFiveMinutesWithLowValue() {
        let lowValue = makeDateWithTime(hours: 0, minutes: 12, seconds: 0)
        let fiveMinutes = sut.fiveMinutes(for: lowValue)
        XCTAssertEqual(fiveMinutes, "YYOOOOOOOOO")
    }
    
    func testFiveMinutesWithNonZeroValues() {
        let testDates = [
            makeDateWithTime(hours: 23, minutes: 59, seconds: 59),
            makeDateWithTime(hours: 12, minutes: 04, seconds: 0),
            makeDateWithTime(hours: 12, minutes: 23, seconds: 0),
            makeDateWithTime(hours: 12, minutes: 35, seconds: 0),
        ]
        
        let singleMinuteValues = testDates.map {
            sut.fiveMinutes(for: $0)
        }
        
        let expectedOutputs = [
            "YYRYYRYYRYY",
            "OOOOOOOOOOO",
            "YYRYOOOOOOO",
            "YYRYYRYOOOO",
        ]
        
        for (actualOutput, expectedOutput) in zip(singleMinuteValues, expectedOutputs) {
            XCTAssertEqual(actualOutput, expectedOutput)
        }
    }
    
    func testSingleHoursWithZeroValue() {
        let zeroDate = makeDateWithTime(hours: 0, minutes: 0, seconds: 0)
        let singleHours = sut.singleHours(for: zeroDate)
        XCTAssertEqual(singleHours, "OOOO")
    }
    
    func testSingleHoursWithNonZeroValues() {
        let testDates = [
            makeDateWithTime(hours: 23, minutes: 59, seconds: 59),
            makeDateWithTime(hours: 2, minutes: 4, seconds: 0),
            makeDateWithTime(hours: 8, minutes: 23, seconds: 0),
            makeDateWithTime(hours: 14, minutes: 35, seconds: 0),
        ]
        
        let singleHourValues = testDates.map {
            sut.singleHours(for: $0)
        }
        
        let expectedOutputs = [
            "RRRO",
            "RROO",
            "RRRO",
            "RRRR",
        ]
        
        for (actualOutput, expectedOutput) in zip(singleHourValues, expectedOutputs) {
            XCTAssertEqual(actualOutput, expectedOutput)
        }
    }
    
    func testFiveHoursWithZeroValue() {
        let zeroDate = makeDateWithTime(hours: 0, minutes: 0, seconds: 0)
        let fiveHours = sut.fiveHours(for: zeroDate)
        XCTAssertEqual(fiveHours, "OOOO")
    }
}

extension ClockConverterTests {
    func makeDateWithTime(hours: Int, minutes: Int, seconds: Int) -> Date {
        let calendar = Calendar.current
        let baseDate = calendar.startOfDay(for: Date())
        let dateComponents = DateComponents(hour: hours,
                                            minute: minutes,
                                            second: seconds)
        return calendar.date(byAdding: dateComponents, to: baseDate)!
    }
}
