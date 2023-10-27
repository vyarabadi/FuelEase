import SwiftUI

struct ContentView: View {
    @State private var animateLogo = false

    var body: some View {
        ZStack {
            Color("bg1")
                .ignoresSafeArea()

            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                    .frame(width: 300.0, height: 300.0)
                    .offset(y: animateLogo ? -200 : 0) // Offset animation
                    .onAppear() {
                        withAnimation(
                            Animation.easeInOut(duration: 1.0)
                                .repeatCount(1, autoreverses: true) // Bounce animation just once
                        ) {
                            animateLogo.toggle()
                        }
                    }

                HStack {
                    NavigationLink(destination: Signup()) {
                        Text("Sign Up")
                            .foregroundColor(Color("ButtonColor"))
                            .padding()
                            .background(Color("bg2"))
                            .cornerRadius(25)
                    }

                    NavigationLink(destination: Login()) {
                        Text("Login")
                            .foregroundColor(Color("ButtonColor"))
                            .padding()
                            .background(Color("bg2"))
                            .cornerRadius(25)
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

// Add a Login view (you can create a new view file for Login)
struct Login: View {
    var body: some View {
        Text("Login View")
    }
}

@main
struct FuelEaseDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
