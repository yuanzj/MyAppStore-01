//
//  AppCardView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct CardButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .cardStyle()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(), value: configuration.isPressed ? 0.9 : 1.0)
    }
    
}

struct AppCardView: View {
    
    var body: some View {
        
        Button(action: {
            print("on tapped!")
        }) {
            VStack(alignment: .leading) {
                Image("img_app_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Text("Craft-文件及笔记编辑器")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 20)
                
                Spacer().frame(height: 10)
                    
                Text("编辑文件和想法")
                    .font(.callout)
                    .foregroundColor(Color.secondary)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
            }
        }
        .buttonStyle(CardButtonStyle())
    }
}

struct AppCardView_Previews: PreviewProvider {
    static var previews: some View {
        AppCardView()
    }
}
