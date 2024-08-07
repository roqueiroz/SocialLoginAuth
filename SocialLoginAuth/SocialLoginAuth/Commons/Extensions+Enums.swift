//
//  Extensions+Enums.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import Foundation

enum AuthState: String {
    case anonymous = "Anonymous"
    case signedIn = "SignedIn"
    case signedOut = "SignedOut"
}

enum SignInProvider: String {
    case google = "google.com"
    case apple = "apple.com"
}
