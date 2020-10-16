import Foundation

protocol ClockConverterType {
    func singleMinutes(for date: Date) -> String
    func fiveMinutes(for date: Date) -> String
}

struct ClockConverter: ClockConverterType {
    static let singleMinuteLampCount = 4
    
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
        return "OOOOOOOOOOO"
    }
}
