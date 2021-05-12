//
//  Extensions.swift
//  netflixclone
//
//  Created by ed on 09/05/2021.
//

import SwiftUI


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(
            colors: [Color.black.opacity(0),
                     Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
