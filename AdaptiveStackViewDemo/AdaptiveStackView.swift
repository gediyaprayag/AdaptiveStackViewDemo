//
//  AdaptiveStackView.swift
//  AdaptiveStackViewDemo
//
//  Created by Prayag Gediya on 02/02/23.
//

import SwiftUI

struct AdaptiveStackView<Content: View>: View {
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let isHorizontalStack: Bool
    let spacing: CGFloat
    let content: () -> Content
    
    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, isHorizontalStack: Bool, spacing: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.isHorizontalStack = isHorizontalStack
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        Group {
            if isHorizontalStack {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            } else {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            }
        }
    }
}
