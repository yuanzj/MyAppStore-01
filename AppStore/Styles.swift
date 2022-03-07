//
//  Styles.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/7.
//
import SwiftUI

struct CardStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
}

extension View {
    
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
    
}


