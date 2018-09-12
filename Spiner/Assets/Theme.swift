//
//  Theme.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 31..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

protocol Theme {
    
    var colors: Colors { get }
    var fonts: Fonts { get }
}

struct DefaultTheme: Theme {
   
    let colors: Colors = DefaultColors()
    let fonts: Fonts = DefaultFonts()
}
