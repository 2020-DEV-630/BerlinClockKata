import XCTest
import Combine
@testable import BerlinClockKata

struct MockClockConverter: ClockConverterType {
    var stringToReturn = ""
    
    func singleMinutes(for date: Date) -> String {
        return stringToReturn
    }
}

class ClockViewModelTests: XCTestCase {
    var clockConverter: MockClockConverter!
    var sut: ClockViewModel!

    override func setUpWithError() throws {
        clockConverter = MockClockConverter()
        sut = ClockViewModel(converter: clockConverter)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSingleMinutesWithOffValues() {
        clockConverter.stringToReturn = "OOOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.singleMinutes, [LampColour](repeating: .off, count: 4))
        }
    }
    
    func testSingleMinutesWithMixedValues() {
        clockConverter.stringToReturn = "YYOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let expectedOutputs: [LampColour] = [.yellow, .yellow, .off, .off]
            XCTAssertEqual(self.sut.singleMinutes, expectedOutputs)
        }
    }

}
