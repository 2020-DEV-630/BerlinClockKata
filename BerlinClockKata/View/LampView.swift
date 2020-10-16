import SwiftUI

struct LampView: View {
    var lampColour: LampColour
    
    var body: some View {
        RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
            .foregroundColor(ViewConstants.colour(for: lampColour))
            .overlay(
                RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
                    .stroke(lineWidth: ViewConstants.borderWidth)
            )
    }
}

struct LampView_Previews: PreviewProvider {
    static var previews: some View {
        LampView(lampColour: .yellow)
    }
}
