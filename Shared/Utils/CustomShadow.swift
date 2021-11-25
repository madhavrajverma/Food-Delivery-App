//
//  CustomShadow.swift
//  CustomShadow
//
//  Created by Madhav Raj Verma on 28/10/21.
//

import SwiftUI

struct CustomShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color.shadowColor.opacity(0.10), radius: 15, x: 6, y: 20)
                            .shadow(color: Color.shadowColor.opacity(0.10), radius: 15, x: -6, y: -20))
    }
}


extension View {
    func customShadow() -> some View {
        modifier(CustomShadow())
    }
}
