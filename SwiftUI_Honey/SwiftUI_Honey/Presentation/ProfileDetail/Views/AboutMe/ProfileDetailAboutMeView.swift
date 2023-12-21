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
            viewStore.send(.aboutMeViewTapped)
        }
    }

    @ViewBuilder
    var headerView: some View {
        HStack {
            HighlightedTitle(text: "About Me")
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
            ForEach([("First name", viewStore.member?.firstName),
                     ("Sexual Orientation", viewStore.member?.sexualOrientationStr),
                     ("Ethnicity", viewStore.member?.ethnicityStr),
                     ("Height", viewStore.member?.heightStr),
                     ("Body Type", viewStore.member?.bodyTypeStr),
                     ("Birthplace", viewStore.member?.birthplaceStr),
                     ("Job", viewStore.member?.jobStr),
                     ("Personality", viewStore.member?.personalityStr),
                     ("Smoke", viewStore.member?.smokeStr),
                     ("Drink", viewStore.member?.drinkStr),
                     ("Religion", viewStore.member?.religionStr),
                     ("Education", viewStore.member?.educationStr),
                     ("Language", viewStore.member?.languageStr),
                     ("Child", viewStore.member?.childStr),
                     ("Parenting Plan", viewStore.member?.parentingPlanStr),
                     ("Interests", viewStore.member?.interestsStr),
                     ("Favorite Food", viewStore.member?.favoriteFoodStr),
                     ("Exercise", viewStore.member?.exerciseStr),
                     ("Frequency", viewStore.member?.mateHealthFreqStr),
                     ("Intensity", viewStore.member?.mateHealthIntnsStr)
                    ], id: \.0) { title, content in
                        AboutMeContainer(title: title, content: content)
            }
        }
    }
    
    @ViewBuilder
    var buddyTypeView: some View {
        VStack(spacing: 8) {
            ForEach([("First name", viewStore.member?.firstName),
                     ("Sexual Orientation", viewStore.member?.sexualOrientationStr),
                     ("Ethnicity", viewStore.member?.ethnicityStr),
                     ("Height", viewStore.member?.heightStr),
                     ("Body Type", viewStore.member?.bodyTypeStr),
                     ("Birthplace", viewStore.member?.birthplaceStr),
                     ("Job", viewStore.member?.jobStr),
                     ("Personality", viewStore.member?.personalityStr),
                     ("Smoke", viewStore.member?.smokeStr),
                     ("Drink", viewStore.member?.drinkStr),
//                     ("Religion", viewStore.member?.religionStr),
//                     ("Education", viewStore.member?.educationStr),
//                     ("Language", viewStore.member?.languageStr),
//                     ("Child", viewStore.member?.childStr),
//                     ("Parenting Plan", viewStore.member?.parentingPlanStr),
//                     ("Interests", viewStore.member?.interestsStr),
//                     ("Favorite Food", viewStore.member?.favoriteFoodStr),
//                     ("Exercise", viewStore.member?.exerciseStr),
//                     ("Frequency", viewStore.member?.mateHealthFreqStr),
//                     ("Intensity", viewStore.member?.mateHealthIntnsStr)
                    ], id: \.0) { title, content in
                AboutMeContainer(title: title, content: content)
            }
        }
    }
    
    struct AboutMeContainer: View {
        @State var title: String
        @State var content: String?
        
        var body: some View {
            HStack(alignment: .top, spacing: 8) {
                HighlightedTitle(text: title)
                AboutMeContent(text: content)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
