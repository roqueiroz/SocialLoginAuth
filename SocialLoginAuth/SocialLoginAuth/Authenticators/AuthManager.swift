//
//  AuthManager.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import FirebaseAuth
import FirebaseCore
import GoogleSignIn


@MainActor
class AuthManager: ObservableObject {
    @Published var authState = AuthState.signedOut
    @Published var user: User?
    
    //MARK: - Private properties
    var isAppleCredentialRevoked = false
    var isGoogleCredentialRevoked = false
    private var authStateHandle: AuthStateDidChangeListenerHandle!
    private let authLinkErrors: [AuthErrorCode] = [.emailAlreadyInUse,
                                                   .credentialAlreadyInUse,
                                                   .providerAlreadyLinked]
    
    init() {
        self.setConfigAuthState()
        
        Task {
            await verifyProvider()
        }
    }
    
    func googleAuth(_ user: GIDGoogleUser) async throws -> AuthDataResult? {
        do {
            guard let token = user.idToken?.tokenString else { return nil }
            let credentials = GoogleAuthProvider.credential(withIDToken: token,
                                                            accessToken: user.accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credentials)
            self.user = result.user
            
            guard let authUser = self.user else {
                self.authState = .signedOut
                return nil
            }
            
            self.authState = authUser.isAnonymous ? .anonymous : .signedIn
            
            return result
            
        } catch {
            throw error
        }
    }
    
    func signOut() async throws {
        if let user = Auth.auth().currentUser {
            GoogleSignInManager.shared.signOutFromGoogle()
            try Auth.auth().signOut()
            self.authState = .signedOut
        }
    }
    
    func getUserName() -> String {
        if authState == .signedIn {
            guard let user else { return AuthState.anonymous.rawValue}
            return user.displayName ?? ""
        }
        
        return ""
    }
    
    func getUserEmail() -> String {
        if authState == .signedIn {
            guard let user else { return AuthState.anonymous.rawValue}
            return user.email ?? ""
        }
        
        return ""
    }
    
}

private extension AuthManager {
    func verifyProvider() async {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            return
        }
        
        for provider in providerData {
            switch SignInProvider(rawValue: provider.providerID) {
                case .apple:
                    self.isAppleCredentialRevoked = await true
                    
                case .google:
                    self.isGoogleCredentialRevoked = await !verifyGoogleSignIn()
                
                default:
                    self.isAppleCredentialRevoked = false
                    self.isGoogleCredentialRevoked = false
            }
            
            if isAppleCredentialRevoked && isGoogleCredentialRevoked {
                if authState != .signedIn {
                    do {
                        try await self.signOut()
                    } catch {
                        print("AuthError: \(error)")
                    }
                }
            }
        }
    }
    
    func setConfigAuthState() {
        authStateHandle = Auth.auth().addStateDidChangeListener({ auth, user in
            self.user = user
            
            guard let authUser = self.user else {
                self.authState = .signedOut
                return
            }
            
            self.authState = authUser.isAnonymous ? .anonymous : .signedIn
            
        })
    }
    
    private func verifyGoogleSignIn() async -> Bool {
        do {
            try await GIDSignIn.sharedInstance.restorePreviousSignIn()
            return true
        }
        catch {
            return false
        }
    }
}
