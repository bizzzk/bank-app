//
//  CustomBorderView.swift
//  task
//
//  Created by Sergey Deryabin on 24.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit


enum RoundType {
    case top
    case none
    case bottom
    case both
}

extension UIView {
    
    func round(with type: RoundType, radius: CGFloat) {
        var corners: UIRectCorner
        
        switch type {
        case .top:
            corners = [.topLeft, .topRight]
        case .none:
            corners = []
        case .bottom:
            corners = [.bottomLeft, .bottomRight]
        case .both:
            corners = [.allCorners]
        }
        
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
}
