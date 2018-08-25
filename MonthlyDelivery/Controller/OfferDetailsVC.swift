//
//  OfferDetailsVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 8/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class OfferDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backBTN(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func negtiateBTNPressed(_ sender: UIButton) {//here we call the view controller by it's id not the segue id
        guard let negotiateVC  = storyboard?.instantiateViewController(withIdentifier: "NegotiationVcID") else {
            return
        }
        //this part is belongs to guard condtion
        PresentDetail(negotiateVC)
    }
    
}
