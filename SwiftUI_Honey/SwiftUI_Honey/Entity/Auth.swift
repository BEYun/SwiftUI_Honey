//
//  Auth.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/20.
//

import Foundation

enum AuthType: String {
    case facebook = "Facebook"
    case instagram = "Instagram"
    case twitter = "Twitter"
    case photo = "Photo Authentication"
    case phone = "Phone Authentication"
}

public struct Auth: Codable, Hashable {
    public init(authFacebookYn: String, facebookNick: String, authTwitterYn: String, twitterNick: String, authInstagramYn: String, instagramNick: String, authPhotoYn: String, memHphoneCertYn: String) {
        self.authFacebookYn = authFacebookYn
        self.facebookNick = facebookNick
        self.authTwitterYn = authTwitterYn
        self.twitterNick = twitterNick
        self.authInstagramYn = authInstagramYn
        self.instagramNick = instagramNick
        self.authPhotoYn = authPhotoYn
        self.memHphoneCertYn = memHphoneCertYn
    }
    
    public var authFacebookYn: String
    public var facebookNick: String
    
    public var authTwitterYn: String
    public var twitterNick: String
    
    public var authInstagramYn: String
    public var instagramNick: String
    
    public var authPhotoYn: String
    public var memHphoneCertYn: String
    
}

public var someAuth: Auth = Auth(authFacebookYn: "y", facebookNick: "@YEONGU_931224", authTwitterYn: "n", twitterNick: "", authInstagramYn: "y", instagramNick: "@YEONGU_93", authPhotoYn: "y", memHphoneCertYn: "n")
