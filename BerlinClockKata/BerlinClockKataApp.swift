import SwiftUI

@main
struct BerlinClockKataApp: App {
    static let viewModel: ClockViewModel = {
        let viewModel = ClockViewModel(converter: ClockConverter())
        let datePublisher = Timer.publish(every: 0.5, on: .main, in: .common)
        viewModel.set(with: datePublisher.eraseToAnyPublisher())
        let _ = datePublisher.connect()
        
        return viewModel
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: BerlinClockKataApp.viewModel)
        }
    }
}
