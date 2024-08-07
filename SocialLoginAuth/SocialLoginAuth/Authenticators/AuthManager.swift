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
                        //To Do - implementar func de deslogar
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
