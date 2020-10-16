import SwiftUI

struct LampView: View {
    @Binding var lampColour: LampColour
    
    var body: some View {
        RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
            .foregroundColor(ViewConstants.colour(for: lampColour))
            .overlay(
                RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
                    .stroke()
            )
    }
}

struct LampView_Previews: PreviewProvider {
    static var previews: some View {
        LampView(lampColour: .constant(.yellow))
    }
}
