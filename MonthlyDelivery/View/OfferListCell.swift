//
//  OfferListCell.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 8/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class OfferListCell: UITableViewCell {

    @IBOutlet weak var offerTime: UILabel!
    @IBOutlet weak var offerLBL: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var driverImg: UIImageView!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        self.driverImg.layer.cornerRadius = driverImg.frame.size.width / 2
        self.carImg.layer.cornerRadius = carImg.frame.size.width / 2
    }

  

}
