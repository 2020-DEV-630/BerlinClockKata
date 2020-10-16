import SwiftUI

struct LampRowView: View {
    var lampColours: [LampColour]
    
    var body: some View {
        HStack {
            ForEach(lampColours.indices, id: \.self) {
                LampView(lampColour: lampColours[$0])
                    .frame(height: ViewConstants.lampHeight)
            }
        }
    }
}

struct LampRowView_Previews: PreviewProvider {
    static var previews: some View {
        LampRowView(lampColours: [.yellow, .yellow, .off, .off])
    }
}
