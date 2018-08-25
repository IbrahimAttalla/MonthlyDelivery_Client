//
//  circelImage.swift
//  MonthlyDelivery
//
//  Created by repo on 7/10/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class circelImage: UIImage {
    
    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
        
    }

}
