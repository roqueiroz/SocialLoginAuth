//
//  Extensions+Enums.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import Foundation

enum AuthState {
    case anonymous
    case signedIn
    case signedOut
}

enum SignInProvider: String {
    case google = "google.com"
    case apple = "apple.com"
}
