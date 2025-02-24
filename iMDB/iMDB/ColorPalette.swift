//
//  ColorPalette.swift
//  iMDB
//
//  Created by Francisco Jasso on 24/02/25.
//

import UIKit

class ColorPalette {
    static let shared = ColorPalette()
    
    var backgroundColor = UIColor()
    var primaryColor = UIColor()
    var accentColor = UIColor()
    var baseFontColor = UIColor()
    var accentFontColor = UIColor()
    
    func setColorPalette(_ traitCollection: UITraitCollection) {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            backgroundColor = DarkColorPalette.backgroundColor
            primaryColor = DarkColorPalette.primaryColor
            accentColor = DarkColorPalette.accentColor
            baseFontColor = DarkColorPalette.baseFontColor
            accentFontColor = DarkColorPalette.accentFontColor
        case .light, .unspecified:
            backgroundColor = LightColorPalette.backgroundColor
            primaryColor = LightColorPalette.primaryColor
            accentColor = LightColorPalette.accentColor
            baseFontColor = LightColorPalette.baseFontColor
            accentFontColor = LightColorPalette.accentFontColor
        default:
            backgroundColor = LightColorPalette.backgroundColor
            primaryColor = LightColorPalette.primaryColor
            accentColor = LightColorPalette.accentColor
            baseFontColor = LightColorPalette.baseFontColor
            accentFontColor = LightColorPalette.accentFontColor
        }
    }
    
    struct LightColorPalette {
        static let backgroundColor = UIColor.white
        static let primaryColor = UIColor(red: 84.0/255, green: 180.0/255, blue: 219.0/255, alpha: 0.5)
        static let accentColor = UIColor(red: 84.0/255, green: 180.0/255, blue: 219.0/255, alpha: 1.0)
        static let baseFontColor = UIColor(red: 38.0/255, green: 46.0/255, blue: 52.0/255, alpha: 1.0)
        static let accentFontColor = UIColor(red: 84.0/255, green: 180.0/255, blue: 219.0/255, alpha: 1.0)
    }

    struct DarkColorPalette {
        static let backgroundColor = UIColor(red: 38.0/255, green: 46.0/255, blue: 52.0/255, alpha: 1.0)
        static let primaryColor = UIColor(red: 12.0/255, green: 37.0/255, blue: 63.0/255, alpha: 0.5)
        static let accentColor = UIColor(red: 84.0/255, green: 180.0/255, blue: 219.0/255, alpha: 1.0)
        static let baseFontColor = UIColor.white
        static let accentFontColor = UIColor(red: 84.0/255, green: 180.0/255, blue: 219.0/255, alpha: 1.0)
    }
  
}
