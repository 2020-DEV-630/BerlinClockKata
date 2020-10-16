import Foundation
import Combine

enum LampColour: Character {
    case yellow = "Y"
    case red = "R"
    case off = "O"
}

fileprivate extension String {
    var lampColours: [LampColour] {
        self.map { LampColour(rawValue: $0) ?? .off }
    }
    
    var asLampColour: LampColour {
        let lampColours = self.compactMap { LampColour(rawValue: $0) }
        return lampColours.first ?? .off
    }
}

class ClockViewModel: ObservableObject {
    let clockConverter: ClockConverterType
    var datePublisher: AnyCancellable?
    
    @Published private var date: Date?
    
    var singleMinutes: [LampColour] {
        return date.map(clockConverter.singleMinutes(for:))?.lampColours ?? []
    }
    var fiveMinutes: [LampColour] {
        return date.map(clockConverter.fiveMinutes(for:))?.lampColours ?? []
    }
    var singleHours: [LampColour] {
        return date.map(clockConverter.singleHours(for:))?.lampColours ?? []
    }
    var fiveHours: [LampColour] {
        return date.map(clockConverter.fiveHours(for:))?.lampColours ?? []
    }
    var seconds: LampColour {
        return date.map(clockConverter.seconds(for:))?.asLampColour ?? .off
    }
    
    init(converter: ClockConverterType) {
        self.clockConverter = converter
    }
    
    deinit {
        datePublisher?.cancel()
    }
    
    func set(with publisher: AnyPublisher<Date, Never>) {
        datePublisher = publisher.sink { (date) in
            self.date = date
        }
    }
}
