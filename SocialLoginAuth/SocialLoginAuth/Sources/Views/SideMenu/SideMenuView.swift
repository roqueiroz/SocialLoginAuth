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
    
    @Binding var selectTab: Int
    @Binding var isShowing: Bool
    @State private var selectMenuItem: SideMenuOption?
    
    
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
                        
                        VStack {
                            ForEach(SideMenuOption.allCases) { item in
                                
                                NavigationLink(value: item.self) {
                                    SideMenuItemView(menuItem: item,
                                                     selectedMenuItem: $selectMenuItem)
                                }
                                
                                
//                                Button(action: {
//                                    onOptionTapped(item)
//                                }, label: {
//                                    SideMenuItemView(menuItem: item,
//                                                     selectedMenuItem: $selectMenuItem)
//                                })
                            }
                        }.navigationDestination(for: SideMenuOption.self) { option in
                            
                            
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        
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
    
    func onOptionTapped(_ item: SideMenuOption) {
        selectMenuItem = item
        selectTab = item.rawValue
        isShowing = false
    }
}

#Preview {
    SideMenuView(selectTab: .constant(0), isShowing: .constant(true))
}
