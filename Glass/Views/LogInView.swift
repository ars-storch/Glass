//
//  LogInView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 24.05.2022.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthFirebase
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                        HStack { Spacer() }
                        Text("Hello.")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Ready to control?")
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
                    viewModel.logIn(withemail: email, password: password)
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
                    
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("Register")
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
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
