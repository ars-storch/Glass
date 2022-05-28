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
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/1200px-Google_Chrome_icon_%28February_2022%29.svg.png"))
                    
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
