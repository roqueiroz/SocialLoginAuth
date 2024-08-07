//
//  RegisterView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var acceptTerms = true
    
    var body: some View {
        VStack(spacing: 25) {
            CustomTextfield(text: $email,
                            title: "Email Address",
                            placeholder: "name@example.com")
            .textInputAutocapitalization(.none)
            
            CustomTextfield(text: $email,
                            title: "Password",
                            placeholder: "Enter your password",
                            isSecureField: true)
            .textInputAutocapitalization(.none)
            
            HStack {
                Toggle("", isOn: $acceptTerms)
                    .frame(width: 50)
                Text("Eu aceito os termos e a politica de privacidade")
                    .padding(.leading, 15)
                    .font(.system(size: 12))
                Spacer()
            }
            
            CustomButton(buttonTitle: "Sign in", buttonImage: "arrow.right")
        }
        .padding(.horizontal)
        .padding(.top, 40)
        Spacer()
    }
}

#Preview {
    RegisterView()
}
