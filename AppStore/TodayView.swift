//
//  TodayView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct TodayView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 30) {
                ForEach(0..<10) { index in
                    AppCardView()
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewDevice("iPhone 12 mini")
    }
}
