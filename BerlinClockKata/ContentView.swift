import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ClockViewModel
    
    var body: some View {
        HStack {
            ForEach(viewModel.singleMinutes.indices, id: \.self) {
                LampView(lampColour: $viewModel.singleMinutes[$0])
                    .frame(height: ViewConstants.lampHeight)
            }
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
