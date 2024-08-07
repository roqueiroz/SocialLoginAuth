//
//  CustomButton.swift
//  SocialLoginAuth
//
//  Created by Jonathan Rocha on 07/08/24.
//

import SwiftUI

struct CustomButton: View {
    let buttonTitle: String
    let buttonImage: String

    var body: some View {
        Button {
            print("Cadastrado")
        } label: {
            HStack {
                Text(buttonTitle)
                    .fontWeight(.semibold)
                Image(systemName: buttonImage)
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 30, height: 45)
            .background(Color(.systemGreen))
            .cornerRadius(10)
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonTitle: "Sign in", buttonImage: "arrow.right")
    }
}
