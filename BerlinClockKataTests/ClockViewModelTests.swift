import XCTest
import Combine
@testable import BerlinClockKata

struct MockClockConverter: ClockConverterType {
    var stringToReturn = ""
    
    func singleMinutes(for date: Date) -> String {
        return stringToReturn
    }
    
    func fiveMinutes(for date: Date) -> String {
        return stringToReturn
    }
    
    func singleHours(for date: Date) -> String {
        return stringToReturn
    }
    
    func fiveHours(for date: Date) -> String {
        return stringToReturn
    }
    
    func seconds(for date: Date) -> String {
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
    
    func testFiveMinutesWithOffValues() {
        clockConverter.stringToReturn = "OOOOOOOOOOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.fiveMinutes, [LampColour](repeating: .off, count: 11))
        }
    }
    
    func testFiveMinutesWithMixedValues() {
        clockConverter.stringToReturn = "YYRYYRYOOOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let expectedOutputs: [LampColour] = [.yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .off, .off, .off, .off]
            XCTAssertEqual(self.sut.fiveMinutes, expectedOutputs)
        }
    }
    
    func testSingleHoursWithOffValues() {
        clockConverter.stringToReturn = "OOOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.singleHours, [LampColour](repeating: .off, count: 4))
        }
    }
    
    func testSingleHoursWithMixedValues() {
        clockConverter.stringToReturn = "RROO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let expectedOutputs: [LampColour] = [.red, .red, .off, .off]
            XCTAssertEqual(self.sut.singleHours, expectedOutputs)
        }
    }
    
    func testFiveHoursWithOffValues() {
        clockConverter.stringToReturn = "OOOO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.fiveHours, [LampColour](repeating: .off, count: 4))
        }
    }
    
    func testFiveHoursWithMixedValues() {
        clockConverter.stringToReturn = "RROO"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let expectedOutputs: [LampColour] = [.red, .red, .off, .off]
            XCTAssertEqual(self.sut.fiveHours, expectedOutputs)
        }
    }

    func testSecondsWithOffValue() {
        clockConverter.stringToReturn = "O"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.seconds, .off)
        }
    }
    
    func testSecondsWithOnValue() {
        clockConverter.stringToReturn = "Y"
        sut.set(with: Just<Date>(Date()).eraseToAnyPublisher())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.sut.seconds, .yellow)
        }
    }
}
