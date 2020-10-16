import SwiftUI

struct LampRowView: View {
    @Binding var lampColours: [LampColour]
    
    var body: some View {
        HStack {
            ForEach(lampColours.indices, id: \.self) {
                LampView(lampColour: $lampColours[$0])
                    .frame(height: ViewConstants.lampHeight)
            }
        }
    }
}

struct LampRowView_Previews: PreviewProvider {
    static var previews: some View {
        LampRowView(lampColours: .constant([.yellow, .yellow, .off, .off]))
    }
}
