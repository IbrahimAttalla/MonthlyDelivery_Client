//
//  OfferListVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 8/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class OfferListVC: UIViewController , UITableViewDelegate  , UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as? OfferListCell
            else { return UITableViewCell()}
      
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //here we call the view controller by it's id not the segue id
        guard let offerDetails  = storyboard?.instantiateViewController(withIdentifier: "OfferDetailsVcID") else {
            return
        }
        //this part is belongs to guard condtion
        PresentDetail(offerDetails)
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        dismissDetail()
    }
}
