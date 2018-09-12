//
//  Colors.swift
//  Spiner
//
//  Created by Máthé Levente on 2017. 08. 31..
//  Copyright © 2017. Levente Máthé. All rights reserved.
//

import UIKit

protocol Colors {
    
    var backgroundDark: UIColor { get }
    var backgroundLight: UIColor { get }
    var tint: UIColor { get }
}

struct DefaultColors: Colors {
    
    let backgroundDark = UIColor(hex: 0x2DD16C)
    let backgroundLight = UIColor(hex: 0x83FFAB)
    let tint = UIColor.white;
}
