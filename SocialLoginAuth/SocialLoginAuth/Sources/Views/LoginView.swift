//
//  LoginView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) { 
                Spacer()
                
                GoogleSignInButton {
                    Task {
                        await signInWithGoogle()
                    }
                }
                .frame(width: 280, height: 45, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                NavigationLink(destination: RegisterView()) {
                    Text("Usar e-mail e senha")
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                        .font(.body.bold())
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .light ? .gray.opacity(0.8) : .gray)
        }
    }
    
    private func signInWithGoogle() async {
//        do {
//            guard let user = try await GoogleSignInManager.shared.signInWithGoogle() else {
//                return
//            }
//            
//            guard let result = try await authManager.googleAuth(user) else {
//                print("Google auth failed")
//                return
//            }
//            
//        } catch {
//            return
//        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
