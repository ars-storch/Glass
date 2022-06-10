//
//  CustomInputField.swift
//  Glass
//
//  Created by Арсений Сторчевой on 24.05.2022.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text:String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                TextField(placeholderText, text: $text)
                    .textInputAutocapitalization(.never)
            }
            
            Divider().background(.gray)
        }

    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "enveloper", placeholderText: "Email", text: .constant(""))
    }
}
