//
//  RegistrationView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 25.05.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    @EnvironmentObject var viewModel: AuthFirebase
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                    HStack { Spacer() }
                    Text("Your Glass.")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Your own rules.")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Create your account.")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedShape(cornerns: [.bottomRight]))
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "E-mail", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                CustomSecureField(imageName: "key", placeholderText: "Password", password: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                
                Spacer()
                
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.register(withemail: email, password: password, username: username, fullName: fullName)
            } label: {
                Text("Signed in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            
            Spacer()
            
            HStack {
                
                Text("Already have an account?")
                    .foregroundColor(.blue)
            
                NavigationLink(destination: LogInView()) {
                    Text("Sign in")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
                Image("GlassFull")
                    .resizable()
                    .frame(width: 25, height: 25)
                
            }
            .padding(.bottom, 30)
            
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
