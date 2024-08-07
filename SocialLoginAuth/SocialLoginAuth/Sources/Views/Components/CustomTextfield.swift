//
//  CustomTextfield.swift
//  SocialLoginAuth
//
//  Created by Jonathan Rocha on 07/08/24.
//

import SwiftUI

struct CustomTextfield: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(text: .constant(""), title: "Email address", placeholder: "jonathan@gmail.com")
    }
}
