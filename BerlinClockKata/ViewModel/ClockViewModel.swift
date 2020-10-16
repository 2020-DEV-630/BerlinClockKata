import Foundation
import Combine

enum LampColour: Character {
    case yellow = "Y"
    case red = "R"
    case off = "O"
}

class ClockViewModel: ObservableObject {
    let clockConverter: ClockConverterType
    var datePublisher: AnyCancellable?
    
    @Published var singleMinutes: [LampColour] = []
    @Published var fiveMinutes: [LampColour] = []
    @Published var singleHours: [LampColour] = []
    @Published var fiveHours: [LampColour] = []
    
    init(converter: ClockConverterType) {
        self.clockConverter = converter
    }
    
    deinit {
        datePublisher?.cancel()
    }
    
    func set(with publisher: AnyPublisher<Date, Never>) {
        datePublisher = publisher.sink { (date) in
            let singleMinutesString = self.clockConverter.singleMinutes(for: date)
            self.singleMinutes = singleMinutesString.map { LampColour(rawValue: $0) ?? .off }
            let fiveMinutesString = self.clockConverter.fiveMinutes(for: date)
            self.fiveMinutes = fiveMinutesString.map { LampColour(rawValue: $0) ?? .off }
            let singleHoursString = self.clockConverter.singleHours(for: date)
            self.singleHours = singleHoursString.map { LampColour(rawValue: $0) ?? .off }
            let fiveHoursString = self.clockConverter.fiveHours(for: date)
            self.fiveHours = fiveHoursString.map { LampColour(rawValue: $0) ?? .off }
        }
    }
}
