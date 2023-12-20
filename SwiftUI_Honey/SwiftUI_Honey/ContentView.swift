//
//  ContentView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/15.
//

import SwiftUI

import ComposableArchitecture

struct ContentView: View {
    var body: some View {
//        let store = Store(initialState: ProfileDetailFeature.State(), reducer: { ProfileDetailFeature() })
//
//        ProfileDetailAboutMeView()
//            .environmentObject(ViewStore(store, observe: {$0}))
//
        ProfileDetailTopMediaView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let store = Store(initialState: ProfileDetailFeature.State(), reducer: { ProfileDetailFeature() })
//
//        ProfileDetailAboutMeView()
//            .environmentObject(ViewStore(store, observe: {$0}))
//
        ProfileDetailTopMediaView()
    }
}
