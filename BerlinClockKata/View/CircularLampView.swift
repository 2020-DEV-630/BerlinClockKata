import SwiftUI

struct CircularLampView: View {
    var lampColour: LampColour
    
    var body: some View {
        Circle()
            .foregroundColor(ViewConstants.colour(for: lampColour))
            .overlay(
                Circle()
                    .stroke()
            )
    }
}

struct CircularLampView_Previews: PreviewProvider {
    static var previews: some View {
        CircularLampView(lampColour: .yellow)
    }
}
