//
//  ProfileDetailModifier.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/21.
//

import SwiftUI

struct HighlightLineModifer: ViewModifier {
    var lines: Int = 0
    
    func body(content: Content) -> some View {
        if lines == 0 {
            content
                .frame(width: 120, alignment: .leading)
        } else {
            content
                .truncationMode(.tail)
        }
    }
}
