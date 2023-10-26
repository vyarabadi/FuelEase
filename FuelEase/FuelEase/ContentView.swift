import SwiftUI

struct ContentView: View {
    @State private var activeSection: ActiveSection = .home
    @State private var isEditing = false
    @State private var textInput: String = ""
    
    enum ActiveSection: String {
        case home, car, clipboard, map, bell
    }

    var body: some View {
        TabView(selection: $activeSection) {
            
            // Home Tab
            
            
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                
                
                VStack {
                    HStack {
                        
                        
                        
            
                        
                        Button(action:{
                            print("Settings")
                        }){
                            Image(systemName: "gear")
                                .font(.largeTitle)
                                .padding()
                                .padding(.bottom,10)
                                .padding(.leading, -10)
                                .foregroundColor(.text)
                            
                        }
                        Spacer()
                        
                        
                        
                       
                                
                        
                    }
                    
                    Button(action: {
                        print("Account")
                    }) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                            . padding()
                            .foregroundColor(.text)
                    }
                    .offset(x: 160, y: 90)
                    
                    Button(action: {
                        print("Settings")
                    }) {
                        Image(systemName: "gear")
                            .font(.largeTitle)
                            . padding()
                            .foregroundColor(.text)
                    }
                    .offset(x: -160, y: 9)
                    
                    
                   
                
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 700) // Adjust the size as needed
                        .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
                        .cornerRadius(63)
                        .overlay(
                            RoundedRectangle(cornerRadius: 64)
                                .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 4)
                        )
                        .offset(x: 0, y: 50)
                    
                        .overlay(
                            Text("Report gas price ")
                                .font(.custom("AbhayaLibre-ExtraBold", size: 48))
                                .foregroundColor(Color("TextColor"))
                                .padding(.bottom, 20)
                                .offset(x: 0, y:-140)
                        )
                    
                    
                    Button(action: {
                        self.activeSection = .car
                    }) {
                        Text("Report Store Name")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .foregroundColor(Color.text)
                            .frame(width: 340, height: 50) // Set a fixed size for the button
                            .background(
                                Capsule()
                                    .fill(Color.button)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.text, lineWidth: 4.0)
                                    )
                            )
                    }
                    .offset(x: 0, y: -400)
                    
                    Button(action: {
                        self.activeSection = .car
                    }) {
                        Text("Enter Location")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .foregroundColor(Color.text)
                            .frame(width: 350, height: 50) // Set a fixed size for the button
                            .background(
                                Capsule()
                                    .fill(Color.button)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.text, lineWidth: 4.0)
                                    )
                            )
                    }
                    .offset(x: 0, y: -360)
                    
                    Button(action: {
                        self.activeSection = .clipboard
                    }) {
                        Text("Enter Gas Price")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .foregroundColor(Color.text)
                            .frame(width: 350, height: 50) // Set a fixed size for the button
                            .background(
                                Capsule()
                                    .fill(Color.button)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.text, lineWidth: 4.0)
                                    )
                            )
                    }
                    .offset(x: 0, y: -320)
                    
                    
                    Button(action: {
                        self.activeSection = .car
                    }) {
                        Text("Report")
                            .font(.custom("AbhayaLibre-ExtraBold", size: 32))
                            .foregroundColor(Color.button)
                            .frame(width: 220, height: 50) // Set a fixed size for the button
                            .background(
                                Capsule()
                                    .fill(Color.text)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.text, lineWidth: 4.0)
                                    )
                            )
                    }
                    .offset(x: 0, y: -280)
                }
            }
            
            
            //home tab
            
           
              
            
            
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(ActiveSection.home)
            
            // Car Tab/search
            
            
            
            
            
            
            ZStack {
                Text("Car Tab/ search things") // Placeholder for car content
            }
            
            
            .tabItem {
                Image(systemName: "car.fill")
                Text("Find gas")
            }
            .tag(ActiveSection.car)
            
            ZStack {
                Text("Report gas price") // Placeholder for report a gas price content
            }
            .tabItem {
                Image(systemName: "clipboard.fill")
                Text("Price Log")
            }
            .tag(ActiveSection.clipboard)
            // Map Tab
            ZStack {
                Text("Map Content") // Placeholder for map content
            }
            .tabItem {
                Image(systemName: "map.fill")
                Text("Map")
            }
            .tag(ActiveSection.map)
            
            // Notifications Tab
            ZStack {

                Text("Notifications") // Placeholder for bell content
            }
            .tabItem {
                Image(systemName: "bell.fill")
                Text("Notifications")
            }
            .tag(ActiveSection.bell)
            
        }
        .onAppear(perform: {
                    let appearance = UITabBarAppearance()
                    appearance.backgroundColor = UIColor(named: "ButtonColor")
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                })
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color("ButtonColor"))
                .shadow(radius:5))

        
        .accentColor(Color("TextColor")) // To ensure the text and icons use your color
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: 390, height: 300) // Adjust the size as needed
            .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
            .cornerRadius(63)
            .overlay(
                RoundedRectangle(cornerRadius: 63)
                    .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 3)
            )
    }
}


