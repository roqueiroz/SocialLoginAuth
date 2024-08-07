//
//  ContentView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                switch authManager.authState {
                        
                    case .signedIn:
                        HomeView()
                        
                    default:
                        LoginView()
                        
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
