//
//  text+Extesnion.swift
//  text+Extesnion
//
//  Created by Madhav Raj Verma on 02/11/21.
//

import Foundation
import SwiftUI


extension Text {
    
    func withPrimaryTextStyle() -> some View {
     return
        self
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
    }
    
    func withSecondaryTextStyle() -> some View {
        return self
            .padding(10)
            .foregroundColor(Color.black)
            .background(Color.chatSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
        
    }
}
