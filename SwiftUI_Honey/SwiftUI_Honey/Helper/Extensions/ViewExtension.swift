//
//  ViewExtension.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/21.
//

import SwiftUI

extension View {
    func highlightedText(lines: Int = 0) -> some View {
        modifier(HighlightLineModifer(lines: lines))
    }
}
