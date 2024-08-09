//
//  Extensions+Enums.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import Foundation
import SwiftUI

enum AuthState: String {
    case anonymous = "Anonymous"
    case signedIn = "SignedIn"
    case signedOut = "SignedOut"
}

enum SignInProvider: String {
    case google = "google.com"
    case apple = "apple.com"
}

enum SideMenuOption: Int, CaseIterable {
    case myAccont
    case notifications
    case exit
    
    var title: String {
        switch self {
            case .myAccont:
                return "Minha Conta"
            case .notifications:
                return "Notificações"
            case .exit:
                return "Sair"
        }
    }
    
    var imageName: String {
        switch self {
            case .myAccont:
                return "person.text.rectangle"
            case .notifications:
                return "bell.circle"
            case .exit:
                return "arrow.left.circle"
        }
    }
}

//MARK: - Extension

extension SideMenuOption: Identifiable {
    var id: Int { return self.rawValue } 
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
