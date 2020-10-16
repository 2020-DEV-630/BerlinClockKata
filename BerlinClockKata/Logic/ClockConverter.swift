import Foundation

protocol ClockConverterType {
    func singleMinutes(for date: Date) -> String
    func fiveMinutes(for date: Date) -> String
    func singleHours(for date: Date) -> String
    func fiveHours(for date: Date) -> String
}

struct ClockConverter: ClockConverterType {
    static let singleMinuteLampCount = 4
    static let fiveMinuteLampCount = 11
    static let singleHourLampCount = 4
    static let fiveHourLampCount = 4
    
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
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour], from: date)
        
        guard let hours = dateComponents.hour else {
            preconditionFailure("date has no hours")
        }
        
        let singleHourCount = hours % (ClockConverter.singleHourLampCount + 1)
        
        return String(repeating: "R", count: singleHourCount)
            + String(repeating: "O", count: ClockConverter.singleHourLampCount - singleHourCount)
    }
    
    func fiveHours(for date: Date) -> String {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour], from: date)
        
        guard let hours = dateComponents.hour else {
            preconditionFailure("date has no hours")
        }
        
        let fiveHourCount = hours / (ClockConverter.singleHourLampCount + 1)
        
        return String(repeating: "R", count: fiveHourCount)
            + String(repeating: "O", count: ClockConverter.fiveHourLampCount - fiveHourCount)
    }
    
    func seconds(for date: Date) -> String {
        return "Y"
    }
}
