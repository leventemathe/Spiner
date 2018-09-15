//
//  Fonts.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 31..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

protocol Fonts {
    
    var header: UIFont { get }
    
    var subHeaderBold: UIFont { get }
    var subHeaderLight: UIFont { get }
    
    var text: UIFont { get }
    
    var buttonLarge: UIFont { get }
}

struct DefaultFonts: Fonts {
    
    let header = UIFont(name: "Amatic-Bold", size: 36.0)!
    let subHeaderBold = UIFont(name: "Lato-Bold", size: 24.0)!
    let subHeaderLight = UIFont(name: "Lato-Light", size: 24.0)!
    let text = UIFont(name: "Lato-Light", size: 14.0)!
    let buttonLarge = UIFont(name: "Lato-Bold", size: 24.0)!
}
