//
//  ProfileDetailUserAuthView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/20.
//

import SwiftUI

import ComposableArchitecture

struct ProfileDetailUserAuthView: View {
    
    @EnvironmentObject var viewStore: ViewStoreOf<ProfileDetailFeature>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            
            content
        }
        .padding(12)
    }
    
    @ViewBuilder
    var title: some View {
        Text("User Authentication")
            .font(.system(size: 18))
            .fontWeight(.bold)
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            viewStore.auth?.authInstagramYn == "y" ? authHStack(type: .instagram, nickName: viewStore.auth?.instagramNick ?? "") : nil
            viewStore.auth?.authFacebookYn == "y" ? authHStack(type: .facebook, nickName: viewStore.auth?.facebookNick ?? "") : nil
            viewStore.auth?.authTwitterYn == "y" ? authHStack(type: .twitter, nickName: viewStore.auth?.twitterNick ?? "") : nil
            viewStore.auth?.authPhotoYn == "y" ? authHStack(type: .photo, nickName: "Complete") : nil
            viewStore.auth?.memHphoneCertYn == "y" ? authHStack(type: .phone, nickName: "Complete") : nil
        }
    }
    
    struct UserAuthTagView: View {
        
        var nickName: String
        
        var body: some View {
            HStack(spacing: 6) {
                Text(nickName)
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                
                Image("imgComplete")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(.gray)
            .clipShape(Capsule())
        }
    }
    
    func authHStack(type: AuthType, nickName: String) -> some View {
        let view = HStack {
            authImage(type: type)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 6)
            
            authName(type: type)
                .padding(.trailing, 12)
            
            UserAuthTagView(nickName: nickName)
            
            Spacer()
        }
        
        return view
    }
    
    func authImage(type: AuthType) -> Image {
        
        switch type {
        case .instagram:
            return Image("icoInsta")
            
        case .facebook:
            return Image("icoFacebook")
            
        case .twitter:
            return Image("icoTwitter")
            
        case .photo:
            return Image("icoPhotoAuth")
            
        case .phone:
            return Image("icoPhoneAuth")
            
        }
    }
    
    func authName(type: AuthType) -> HighlightedTitle {
        return HighlightedTitle(text: type.rawValue, lines: 1)
    }
}

struct ProfileDetailUserAuthView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(initialState: ProfileDetailFeature.State(), reducer: { ProfileDetailFeature() })

//        ProfileDetailAboutMeView()
        ProfileDetailUserAuthView()
            .environmentObject(ViewStore(store, observe: {$0}))

//        ProfileDetailTopMediaView()
    }
}
