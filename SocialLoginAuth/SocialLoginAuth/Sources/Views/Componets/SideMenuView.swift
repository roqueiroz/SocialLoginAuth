//
//  SideMenuView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorSchema
    
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        Spacer()
                        
                        Button(action: {
                            signOut()
                            isShowing = false
                        }, label: {
                            Image(systemName: "arrow.left.circle")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Text("Sair")
                                .foregroundColor(.black)
                        })
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                    
                   
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
    }
    
    func signOut() {
        Task {
            do {
                try await authManager.signOut()
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
