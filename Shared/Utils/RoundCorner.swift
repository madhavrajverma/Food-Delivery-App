//
//  RoundCorner.swift
//  RoundCorner
//
//  Created by Madhav Raj Verma on 26/10/21.
//

import Foundation
import SwiftUI


struct CustomCorner :Shape {
    func path(in rect:CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft,.topRight],
                                cornerRadii: CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}
