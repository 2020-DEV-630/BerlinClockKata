import SwiftUI
import Combine

@main
struct BerlinClockKataApp: App {
    static let viewModel: ClockViewModel = {
        let viewModel = ClockViewModel(converter: ClockConverter())
        let datePublisher = Deferred { Just(Date()) }
            .append(Timer.publish(every: 0.5, on: .main, in: .common).autoconnect())
            .eraseToAnyPublisher()
        viewModel.set(with: datePublisher)
        
        return viewModel
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: BerlinClockKataApp.viewModel)
        }
    }
}
