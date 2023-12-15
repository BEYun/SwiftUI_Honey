//
//  ProfileDetailFeature.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/15.
//

import Foundation

import ComposableArchitecture

public struct ProfileDetailFeature: Reducer {
    
    public init() {}
    
    public struct State: Equatable {
        public var member: Member?
        public var isTranslated: Bool = false
        public var isOpen: Bool = false
    }
    
    public enum Action {
        case openProfile
        // AboutMeView
        case translateButtonTapped
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .openProfile:
                return .none
                
            case .translateButtonTapped:
                state.isTranslated.toggle()
                return .none
            }
        }
    }
}
