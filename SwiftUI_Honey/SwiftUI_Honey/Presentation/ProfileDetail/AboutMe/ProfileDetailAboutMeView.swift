//
//  ProfileDetailAboutMeView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/15.
//
//

import SwiftUI
import ComposableArchitecture

public struct ProfileDetailAboutMeView: View {
    
    @EnvironmentObject var viewStore: ViewStoreOf<ProfileDetailFeature>
    
    public var body: some View {
        VStack(spacing: 8) {
            headerView
            introduceTextView
            bodyView
        }
        .padding(12)
        .background(.white)
        .cornerRadius(12)
        .contentShape(Rectangle())
        .onTapGesture {
            print("전체열람 팝업 띄우기")
        }
    }

    @ViewBuilder
    var headerView: some View {
        HStack {
            AboutMeTitle(text: "About Me")
            Spacer()
            translateButton
        }
    }
    
    @ViewBuilder
    var introduceTextView: some View {
        if let introductionStr = viewStore.member?.introductionStr {
            Text(introductionStr)
                .kerning(-0.42)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    var translateButton: some View {
        Button("translate") {
            viewStore.send(.translateButtonTapped)
        }
        .font(.system(size: 14))
        .foregroundColor(.gray)
    }
    
    @ViewBuilder
    var bodyView: some View {
        Group {
            if viewStore.member?.marriageType == .buddy {
                buddyTypeView
            } else {
                marriageTypeView
            }
        }
    }
    
    @ViewBuilder
    var marriageTypeView: some View {
        VStack(spacing: 8) {
            //            Group {
            ForEach([("First name", viewStore.member?.firstName),
                     ("Sexual Orientation", viewStore.member?.sexualOrientationStr)], id: \.0) { title, content in
                AboutMeContainer(title: title, content: content)
            }
            
            //                AboutMeContainer(title: "First name", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Sexual Orientation", content: viewStore.isTranslated ? "번역됌" : viewStore.member?.sexualOrientationStr)
            //                AboutMeContainer(title: "Ethnicity", content: viewStore.member?.ethnicityStr)
            //                AboutMeContainer(title: "Height", content: viewStore.member?.heightStr)
            //                AboutMeContainer(title: "Body Type", content: viewStore.member?.bodyTypeStr)
            //                AboutMeContainer(title: "Birthplace", content: viewStore.member?.birthplaceStr)
            //                AboutMeContainer(title: "Job", content: viewStore.member?.jobStr)
            //                AboutMeContainer(title: "Personality", content: viewStore.member?.personalityStr)
            //                AboutMeContainer(title: "Smoke", content: viewStore.member?.smokeStr)
            //                AboutMeContainer(title: "Drink", content: viewStore.member?.drinkStr)
            //            }
            //
            //            Group {
            //                AboutMeContainer(title: "Religion", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Education", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Language", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Child", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Parenting Plan", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Interests", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Favorite Food", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Exercise", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Frequency", content: viewStore.member?.firstName)
            //                AboutMeContainer(title: "Intensity", content: viewStore.member?.firstName)
            //            }
            
        }
    }
    
    @ViewBuilder
    var buddyTypeView: some View {
        VStack(spacing: 8) {
            Group {
                AboutMeContainer(title: "First name", content: viewStore.member?.firstName)
                AboutMeContainer(title: "Sexual Orientation", content: viewStore.member?.sexualOrientationStr)
                AboutMeContainer(title: "Ethnicity", content: viewStore.member?.ethnicityStr)
                AboutMeContainer(title: "Height", content: viewStore.member?.heightStr)
                AboutMeContainer(title: "Body Type", content: viewStore.member?.bodyTypeStr)
                AboutMeContainer(title: "Birthplace", content: viewStore.member?.birthplaceStr)
                AboutMeContainer(title: "Job", content: viewStore.member?.jobStr)
                AboutMeContainer(title: "Personality", content: viewStore.member?.personalityStr)
                AboutMeContainer(title: "Smoke", content: viewStore.member?.smokeStr)
                AboutMeContainer(title: "Drink", content: viewStore.member?.drinkStr)
            }
        }
    }
    
    struct AboutMeContainer: View {
        var title: String
        var content: String?
        
        var body: some View {
            HStack(alignment: .top, spacing: 8) {
                AboutMeTitle(text: title)
                AboutMeContent(text: content)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct AboutMeTitle: View {
        var text: String
        
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
                .frame(width: 120, alignment: .leading)
        }
    }
    
    struct AboutMeContent: View {
        var text: String? = ""
        var isOpen: Bool = false
        
        var body: some View {
            contentView
        }
        
        @ViewBuilder
        var contentView: some View {
            if isOpen {
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
                    Image(systemName: image)
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
                Image(systemName: "icoUnlockCircle")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

struct ProfileDetailAboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailAboutMeView()
    }
}
