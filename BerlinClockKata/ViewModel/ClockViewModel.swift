import Foundation
import Combine

enum LampColour: Character {
    case yellow = "Y"
    case off = "O"
}

class ClockViewModel: ObservableObject {
    let clockConverter: ClockConverterType
    var datePublisher: AnyCancellable?
    
    @Published var singleMinutes: [LampColour] = []
    
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
        }
    }
}
