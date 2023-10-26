import SwiftUI
struct ContentView: View {
    var body: some View {
        ZStack {
            Color("bg1")
                .ignoresSafeArea()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 300.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
