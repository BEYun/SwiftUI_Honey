//
//  Photo.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/19.
//

import SwiftUI

struct Photo: Identifiable, Hashable {
    var id: UUID = .init()
    var color: Color
}
