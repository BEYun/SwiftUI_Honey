//
//  ProfileDetailAboutMeView + CustomView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/20.
//

import SwiftUI

import ComposableArchitecture

struct HighlightedTitle: View {
    var text: String
    var lines: Int = 0
    
    var body: some View {
        Text(text)
            .kerning(-0.39)
            .font(.system(size: 13))
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .background(alignment: .bottom, content: {
                Color.yellow
                    .clipShape(Capsule())
                    .frame(height: 9)
                    .offset(y: -2)
            })
            .highlightedText(lines: lines)
    }
}

struct AboutMeContent: View {
    @EnvironmentObject var viewStore: ViewStoreOf<ProfileDetailFeature>
    
    var text: String? = ""
    
    var body: some View {
        contentView
    }
    
    @ViewBuilder
    var contentView: some View {
        if viewStore.isOpen {
            emptyCheckedText
        } else {
            PaintedView()
        }
    }
    
    @ViewBuilder
    var emptyCheckedText: some View {
        let text = self.text ?? ""
        
        Text(!text.isEmpty ? text : "No Comment")
            .kerning(-0.42)
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PaintedView: View {
    @EnvironmentObject var viewStore: ViewStoreOf<ProfileDetailFeature>
    
    var isFirstContent: Bool = false
    var isHighlited: Bool = true
    var lines: Int = 2
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            paintImageView()
            unlockBadgeView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func paintImageView() -> some View {
        let randomImage = [
            "imgPainter01",
            "imgPainter02",
            "imgPainter03",
            "imgPainter04"
        ].randomElement() ?? "imgPainter01"
        let randomHighlightImage = [
            "imgPainterHighlight01",
            "imgPainterHighlight02",
            "imgPainterHighlight03",
            "imgPainterHighlight04"
        ].randomElement() ?? "imgPainterHighlight01"
        
        let image = isHighlited ? randomHighlightImage : randomImage
        
        // -48 - 120 - 28
        // padding + titleWidth + spacing + unlockBadge
        let max = UIScreen.main.bounds.size.width - 48 - 120 - 28
        let random = CGFloat.random(in: 80...max)
        
        return VStack(alignment: .leading, spacing: 4) {
            ForEach(0..<self.lines, id: \.self) { _ in
                Image(image)
                    .resizable()
                    .frame(width: isFirstContent ? 80 : random, height: 16)
                    .offset(y: 4)
            }
        }
    }
    
    @ViewBuilder
    var unlockBadgeView: some View {
        if isFirstContent {
            HStack(spacing: 2) {
                Image("icoUnlock")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(.leading, 6)
                
                Text("Unlock!")
                    .kerning(-0.42)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
            .background(.gray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
            
        } else {
            Image("icoUnlockCircle")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}
