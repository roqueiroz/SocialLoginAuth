//
//  LoginView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI
import GoogleSignInSwift
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack() {
            Spacer()
            
            //MARK: - Apple Auth
            SignInWithAppleButton(
                onRequest: { request in },
                onCompletion: { result in }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(width: 280, height: 40, alignment: .center)
            
            //MARK: - Google Auth
            GoogleSignInButton(viewModel: .init(scheme: .dark, style: .wide)) {
                Task {
                    await signInWithGoogle()
                }
            }
            .frame(width: 280, height: 55, alignment: .center)
            
            NavigationLink(destination: RegisterView()) {
                Text("Usar e-mail e senha")
                //                    .foregroundStyle(.white)
                    .foregroundStyle(.gray)
                    .font(.body.bold())
            }
            
        }
        
        //        NavigationStack {
        //            VStack(spacing: 16) {
        //                Spacer()
        //
        //                //MARK: - Apple Auth
        //                SignInWithAppleButton(
        //                    onRequest: { request in },
        //                    onCompletion: { result in }
        //                )
        //                .signInWithAppleButtonStyle(.black)
        //                .frame(width: 280, height: 40, alignment: .center)
        //                .clipShape(RoundedRectangle(cornerRadius: 8))
        //
        //                //MARK: - Google Auth
        //                GoogleSignInButton {
        //                    Task {
        //                        await signInWithGoogle()
        //                    }
        //                }
        //                .frame(width: 280, height: 40, alignment: .center)
        //                .clipShape(RoundedRectangle(cornerRadius: 8))
        //
        //                NavigationLink(destination: RegisterView()) {
        //                    Text("Usar e-mail e senha")
        //                        .foregroundStyle(.white)
        //                        .font(.body.bold())
        //                }
        //            }
        //            .padding()
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            //.background(.red.opacity(0.8))
        //        }
    }
    
    private func signInWithGoogle() async {
        do {
            guard let user = try await GoogleSignInManager.shared.signInWithGoogle() else {
                return
            }
            
            guard let result = try await authManager.googleAuth(user) else {
                print("Google auth failed")
                return
            }
            
        } catch {
            return
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
