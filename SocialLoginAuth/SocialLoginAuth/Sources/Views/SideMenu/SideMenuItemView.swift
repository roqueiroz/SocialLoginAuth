//
//  SideMenuItemView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct SideMenuItemView: View {
    let menuItem: SideMenuOption
    @Binding var selectedMenuItem: SideMenuOption?
    
    private var isSelected: Bool {
        return selectedMenuItem == menuItem
    }
    
    var body: some View {
        HStack {
            Image(systemName: menuItem.imageName)
            
            Text(menuItem.title)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuItemView(menuItem: .exit, 
                     selectedMenuItem: .constant(.exit))
}
