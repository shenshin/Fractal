//
//  FractalView.swift
//  Fractal
//
//  Created by Алесь Шеншин on 09/02/2019.
//  Copyright © 2019 Shenshin. All rights reserved.
//

import UIKit

class FractalView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        
        let point = Point(inside: rect, withSize: 5)
        point.fill(.centerCenter)
        
    }
}
