//
//  Member.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/15.
//

import Foundation

public struct Member: Identifiable, Hashable {
    public typealias ID = UUID
    
    public var id: ID = UUID()
    
    /// About Me 자기소개
    public var introductionStr: String?
    public var introductionKey: String?
    
    /// First Name
    public var firstName: String?
    public var firstNameKey: String?
    
    /// Last Name
    public var lastName: String?
    
    /// 직업
    public var jobStr: String?
    public var jobKey: String?
    
    /// 자녀 계획
    public var parentingPlanStr: String?
    public var parentingPlanKey: String?
    
    /// 스타일
    public var personalityStr: String?
    public var personalityKey: String?
    
    /// 언어
    public var languageStr: String?
    public var languageKey: String?
    
    /// 취미, 흥미 (다중 선택)
    public var interestsStr: String?
    public var interestsKey: String?
    
    /// 좋아하는 음식 (다중선택)
    public var favoriteFoodStr: String?
    public var favoriteFoodKey: String?
    
    /// 운동 (다중선택)
    public var exerciseStr: String?
    public var exerciseKey: String?
    
    /// 민족성
    public var ethnicityStr: String?
    public var ethnicityKey: String?
    
    /// 키
    public var heightStr: String?
    public var heightKey: String?
    
    /// 체형
    public var bodyTypeStr: String?
    public var bodyTypeKey: String?
    
    /// 출생지
    public var birthplaceStr: String?
    public var birthplaceKey: String?
    
    /// 담배
    public var smokeStr: String?
    public var smokeKey: String?
    
    /// 음주
    public var drinkStr: String?
    public var drinkKey: String?
    
    /// 종교
    public var religionStr: String?
    public var religionKey: String?
    /// 종교 항목 표시 여부
    public var religionIsOpen: Types.OpenEnable?
    
    
    /// 학력
    public var educationStr: String?
    public var educationKey: String?
    
    /// 자녀
    public var childStr: String?
    public var childKey: String?
    
    /// 성적취향
    public var sexualOrientationStr: String?
    public var sexualOrientationKey: String?
    
    /// 공개여부
    public var sexualOrientationIsOpen: Types.OpenEnable?
    
    /// 성혼 유형
    public var marriageType: MarriageType
//    public var marriageTypeStr: String?
    
    /// 별자리 - buddy 일때만 들어감
    public var starSignStr: String?
    public var starSignKey: String?
    
    /// 운동 강도
    public var mateHealthIntnsStr: String?
    public var mateHealthIntnsKey: String?
    
    /// 운동 주기
    public var mateHealthFreqStr: String?
    public var mateHealthFreqKey: String?
}

extension Member {
     
    public enum Types {
        
        public enum OpenEnable: String, Codable, Hashable {
            case disable = "n"
            case enable = "y"
        }
    }
}

public enum MarriageType: String, Codable, Equatable {
    case marriage = "w"
    case digamy = "r"
    case buddy  = "b"
}

public var someMember: Member = Member(id: UUID(), introductionStr: "안녕하세요", introductionKey: "introduction", firstName: "메", firstNameKey: "firstName", lastName: "시", jobStr: "축구선수", jobKey: "jobKey", parentingPlanStr: "예", parentingPlanKey: "parentingPlan", personalityStr: "좋다", personalityKey: "personality", languageStr: "영어, 스페인어", languageKey: "language", interestsStr: "축구", interestsKey: "interests", favoriteFoodStr: "햄버거", favoriteFoodKey: "favoriteFood", exerciseStr: "달리기", exerciseKey: "exercise", ethnicityStr: "라틴족", ethnicityKey: "ethnicity", heightStr: "169cm", heightKey: "height", bodyTypeStr: "날씬함", bodyTypeKey: "bodyType", birthplaceStr: "아르헨티나 어딘가", birthplaceKey: "birthplace", smokeStr: "아니오", smokeKey: "smoke", drinkStr: "아니오", drinkKey: "drink", religionStr: "없음", religionKey: "religionStr", religionIsOpen: .enable, educationStr: "아니오", educationKey: "education", childStr: "혼자", childKey: "child", sexualOrientationStr: "여성", sexualOrientationKey: "sexualOrientation", sexualOrientationIsOpen: .enable, marriageType: .marriage, starSignStr: "천칭자리", starSignKey: "starSign", mateHealthIntnsStr: "가볍게", mateHealthIntnsKey: "mateHealthIntns", mateHealthFreqStr: "주에 한 번", mateHealthFreqKey: "mateHealthFreq")
