//
//  CustomSecureField.swift
//  Glass
//
//  Created by Арсений Сторчевой on 25.05.2022.
//

import SwiftUI

struct CustomSecureField: View {
    let imageName: String
    let placeholderText: String
    @Binding var password:String
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
            }
            
            Divider().background(.gray)
            
        }

    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "enveloper", placeholderText: "Email", text: .constant(""))
    }
}
