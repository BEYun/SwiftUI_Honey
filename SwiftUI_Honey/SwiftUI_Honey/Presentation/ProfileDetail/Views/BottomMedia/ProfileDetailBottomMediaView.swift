//
//  ProfileDetailBottomMediaView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/20.
//

import SwiftUI

struct ProfileDetailBottomMediaView: View {
    var items: [GridItem] = [
        GridItem(.flexible(minimum: 104), spacing: 8),
        GridItem(.flexible(minimum: 104), spacing: 8),
        GridItem(.flexible(minimum: 104), spacing: 8)
    ]
    
    var body: some View {
        VStack(spacing: 11) {
            HStack {
                Text("Photo / Video")
                    .foregroundColor(.black)
                    .font(.title)

                Spacer()
            }
                        
            LazyVGrid(columns: items) {
                ForEach((0...5), id: \.self) { _ in
                    Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                        .cornerRadius(15)
                        .aspectRatio(1, contentMode: .fill)
                }
            }
        }
        .padding(.top, 12)
        .padding(.horizontal, 12)
        .padding(.bottom, 16)
    }
}

struct ProfileDetailBottomMediaView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailBottomMediaView()
    }
}
