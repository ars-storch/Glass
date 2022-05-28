//
//  RoundedShape.swift
//  Glass
//
//  Created by Арсений Сторчевой on 24.05.2022.
//

import SwiftUI

struct RoundedShape: Shape {
    var cornerns: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: cornerns, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
