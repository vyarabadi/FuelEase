//
//  ContentView.swift
//  LogOut
//
//  Created by Diya Patel on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.accent).edgesIgnoringSafeArea(.all)
        
        /*ZStack {
        RoundedRectangle(cornerRadius: 63)
        .frame(width: 390, height: 693)
        .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
        .overlay(
        RoundedRectangle(cornerRadius: 63)
        .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 3))
        .shadow(color: Color(red: 0.98, green: 0.953, blue: 0.941), radius: 4, x: 0, y: 4)
                        
        RoundedRectangle(cornerRadius: 63)
        .frame(width: 390, height: 693)
        .clipped()
         }
        .frame(height: 693)
        .padding(.top, 201)
            */
            
        Rectangle()
        .frame(width: 400, height: 600)
        .foregroundColor(Color(red: 0.98, green: 0.953, blue: 0.941))
        .cornerRadius(63)
        .overlay(
        RoundedRectangle(cornerRadius: 64)
        .stroke(Color(red: 0.451, green: 0.235, blue: 0.149), lineWidth: 4))
        .frame(height: 693)
        .padding(.top, 230)
           
        VStack(spacing: 30) {
            // Thank you and logout messages
            VStack(spacing: 30) {
                Text("Thank you!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.top, 160)
                Text("You are successfully Logged out!")
                    .font(.title2)
                    .foregroundColor(.black)
                }

                // Login button
                Button(action: {
                    // Action to handle login
                    print("Login tapped!")
                }) {
                    Text("Log-in")
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color.brown)
                        .cornerRadius(25)
                        .padding(.top, 90)
                }
            }
            .padding()
        }
    }
}

struct LogoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
