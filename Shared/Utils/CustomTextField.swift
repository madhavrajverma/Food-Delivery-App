//
//  CustomTextField.swift
//  CustomTextField
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import Foundation
import SwiftUI

struct customTextFieldModifier:ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.3).opacity(0.2))
            .cornerRadius(10)
            .customShadow()
    }
}

