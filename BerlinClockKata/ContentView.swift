import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ClockViewModel
    
    var body: some View {
        VStack {
            CircularLampView(lampColour: viewModel.seconds)
                .frame(height: ViewConstants.circularLampHeight)
            LampRowView(lampColours: viewModel.fiveHours)
            LampRowView(lampColours: viewModel.singleHours)
            LampRowView(lampColours: viewModel.fiveMinutes)
            LampRowView(lampColours: viewModel.singleMinutes)
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel: ClockViewModel = {
        let viewModel = ClockViewModel(converter: ClockConverter())
        viewModel.set(with: Just(Date()).eraseToAnyPublisher())
        
        return viewModel
    }()
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
