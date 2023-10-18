//
//  RoundedShape.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import Foundation
import SwiftUI

//reusable functionality that rounded the the rectangle on login/ signin screen
struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
     let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
