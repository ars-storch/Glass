//
//  LogInView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 24.05.2022.
//

import SwiftUI
import UIKit
import SwiftyVK

struct LogInView: View {
    
    @State private var showingSheet = false
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
                    
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("VK Log in")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .padding(.top)
                            .padding(.trailing, 24)
                    }
                    .sheet(isPresented: $showingSheet) {VKLogInViewController()}
                }
                
                Button {
                    viewModel.logIn(withemail: email, password: password)
                } label: {
                    Text("Sign in")
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

//struct VKLogInView: View {
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        // View Controller Representative.
//        Button("Press to dismiss") {
//            dismiss()
//        }
//        .font(.title)
//        .padding()
//        .background(.black)
//    }
//}

struct VKLogInViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = VKAuthViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
}

class VKAuthViewController: UIViewController, SwiftyVKDelegate {
    
    override func viewDidLoad() {
        VK.setUp(appId: APIWorker.apiKey, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        APIWorker.authorize()
    }
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return Scopes([.wall, .friends])
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        if let topVC = UIApplication.getTopViewController() { topVC.present(viewController, animated: true) }
      // Called when SwiftyVK wants to present UI (e.g. webView or captcha)
      // Should display given view controller from current top view controller
    }

}
