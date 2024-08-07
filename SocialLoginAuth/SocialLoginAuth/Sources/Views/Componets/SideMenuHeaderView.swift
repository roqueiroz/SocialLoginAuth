//
//  SideMenuHeaderView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorSchema
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .imageScale(.large)
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(authManager.getUserName())
                    .font(.subheadline)
                    .foregroundStyle(.black)
                Text(authManager.getUserEmail())
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
