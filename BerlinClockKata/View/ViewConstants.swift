import SwiftUI

enum ViewConstants {
    static let lampHeight: CGFloat = 40.0
    static let circularLampHeight: CGFloat = 100.0
    static let borderWidth: CGFloat = 10.0
    static let cornerRadius: CGFloat = 15.0
    
    static func colour(for lampColour: LampColour) -> Color {
        switch lampColour {
        case .yellow:
            return .yellow
        case .red:
            return .red
        case .off:
            return .gray
        }
    }
}
