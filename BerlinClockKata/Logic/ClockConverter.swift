import Foundation

protocol ClockConverterType {
    func singleMinutes(for date: Date) -> String
    func fiveMinutes(for date: Date) -> String
}

struct ClockConverter: ClockConverterType {
    static let singleMinuteLampCount = 4
    static let fiveMinuteLampCount = 11
    
    func singleMinutes(for date: Date) -> String {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.minute], from: date)
        
        guard let minutes = dateComponents.minute else {
            preconditionFailure("date has no minutes")
        }
        
        let singleMinuteCount = minutes % (ClockConverter.singleMinuteLampCount + 1)
        
        return String(repeating: "Y", count: singleMinuteCount)
            + String(repeating: "O", count: ClockConverter.singleMinuteLampCount - singleMinuteCount)
    }
    
    func fiveMinutes(for date: Date) -> String {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.minute], from: date)
        
        guard let minutes = dateComponents.minute else {
            preconditionFailure("date has no minutes")
        }
        
        let fiveMinuteCount = minutes / (ClockConverter.singleMinuteLampCount + 1)
        
        return (0..<ClockConverter.fiveMinuteLampCount).map { index -> String in
            guard index < fiveMinuteCount else {
                return "O"
            }
            
            return (index + 1) % 3 == 0 ? "R": "Y"
        }.joined()
    }
    
    func singleHours(for date: Date) -> String {
        return "OOOO"
    }
}
