//
//  GoogleSignInManager.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import Foundation
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

typealias GoogleAuthResult = (GIDGoogleUser?, Error?) -> Void

class GoogleSignInManager {
    static let shared = GoogleSignInManager()
    
    private init() { }
    
    func signOutFromGoogle() {
        GIDSignIn.sharedInstance.signOut()
    }
    
    @MainActor
    func signInWithGoogle() async throws -> GIDGoogleUser? {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() { 
            try await GIDSignIn.sharedInstance.restorePreviousSignIn()
            return try await GIDSignIn.sharedInstance.currentUser?.refreshTokensIfNeeded()
        } else {
            return try await signInFlow()
        }
    }
}

@MainActor
private extension GoogleSignInManager {
    func signInFlow() async throws -> GIDGoogleUser? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return nil
        }
        
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        return result.user
    }
}
