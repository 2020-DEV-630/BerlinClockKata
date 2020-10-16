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
