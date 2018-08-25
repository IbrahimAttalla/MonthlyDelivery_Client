//
//  RoundedButton.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 7/2/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable var corrnarRadius : CGFloat = 3.0  {
                didSet{
                    self.layer.cornerRadius = corrnarRadius
                    self.clipsToBounds = true
                    
                }
            }
    
    @IBInspectable
    var topGradientColor: UIColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor = #colorLiteral(red: 0.4772565038, green: 0.05509755787, blue: 0.001355159928, alpha: 1) {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }


    
    
}
