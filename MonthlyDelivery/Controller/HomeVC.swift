//
//  HomeVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 6/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class HomeVC: UIViewController  ,UIPickerViewDataSource , UIPickerViewDelegate ,UITextFieldDelegate {
    
  
    
    
    // to check which textfield selected
    var checkTextField : Int = 0
    // to set the count of list
    var num : Int = 0
    // to set the value of row
    var valueOfRow : String = " "
    
    // outlet
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var inerWidth: NSLayoutConstraint!
    @IBOutlet weak var containerLeading: NSLayoutConstraint!
    @IBOutlet weak var outerWidth: NSLayoutConstraint!
    
    @IBOutlet weak var carBrandTxtFld: UITextField!
    @IBOutlet weak var carModelTxtFld: UITextField!
    @IBOutlet weak var cartypeTxtFld: UITextField!
    @IBOutlet weak var seatsTld: UITextField!
    @IBOutlet weak var fromDateTF: UITextField!
    @IBOutlet weak var toDateTF: UITextField!
    @IBOutlet weak var departingTF: UITextField!
    @IBOutlet weak var returnTF: UITextField!
    
    @IBOutlet weak var seatsPicker: UIPickerView!
    @IBOutlet weak var brandPicker: UIPickerView!
    @IBOutlet weak var modelPicker: UIPickerView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var fDatePicker: UIDatePicker!
    @IBOutlet weak var tDatePicker: UIDatePicker!
    @IBOutlet weak var depatringTimePicker: UIDatePicker!
    @IBOutlet weak var retunringTimePicker: UIDatePicker!
    
    // dropDown Lists
    var carBrandList = ["Brand 1","Brand 2","Brand 3","Brand 4","Brand 5"]
    var carModelList = ["model 1","model 2 ","model 3","model 4","model 5"]
    var cartypeList =  ["type 1","type 2","type 3","type 4","type 5"]
    var carSeatsList = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carBrandTxtFld.delegate = self
        carModelTxtFld.delegate = self
        seatsTld.delegate = self
        cartypeTxtFld.delegate = self
        fromDateTF.delegate = self
        toDateTF.delegate = self
        departingTF.delegate = self
        returnTF.delegate = self

        
        sideMenuIn()
// ADD Gesture
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.containerView.addGestureRecognizer(swipeRight)
        
        let Viewtap = UITapGestureRecognizer(target: self, action: #selector(sideMenuIn))
        self.containerView.addGestureRecognizer(Viewtap)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    
    
    @IBAction func sideMenuBTNPressed(_ sender: UIButton) {
        sideMenuOut()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == brandPicker {
            num = self.carBrandList.count
            return  num
        }
        else if pickerView == modelPicker {
           num = self.carModelList.count
            return num
        }
        else if pickerView == typePicker {
            num = self.cartypeList.count
            return  num
        }
        else if pickerView == seatsPicker {
            num = self.carSeatsList.count
            return num
        }
        return num
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if checkTextField == 1 {
            self.valueOfRow =  self.carBrandList[row]
            self.view.endEditing(true)
            return valueOfRow
        }
        else if checkTextField == 2 {
             self.valueOfRow =  self.carModelList[row]
            self.view.endEditing(true)
            return valueOfRow

        }
        else if checkTextField == 3 {
             self.valueOfRow =  self.cartypeList[row]
            self.view.endEditing(true)
            return valueOfRow

        }
        else if checkTextField == 4 {
             self.valueOfRow =  self.carSeatsList[row]
            self.view.endEditing(true)
            return valueOfRow

        }
        return valueOfRow
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if checkTextField == 1 {
        self.brandPicker.isHidden = true
        self.carBrandTxtFld.text = self.carBrandList[row]

        }
        else if checkTextField == 2 {
            self.modelPicker.isHidden = true
            self.carModelTxtFld.text = self.carModelList[row]
        }
        else if checkTextField == 3 {
            self.typePicker.isHidden = true
            self.cartypeTxtFld.text = self.cartypeList[row]
        }
        else if checkTextField == 4 {
            self.seatsPicker.isHidden = true
            self.seatsTld.text = self.carSeatsList[row]
        }
      
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.carBrandTxtFld {
            viewTapped()
            self.brandPicker.isHidden = false
            checkTextField = 1
            print(checkTextField)
        }
        else if textField == self.carModelTxtFld {
            viewTapped()

            self.modelPicker.isHidden = false
            checkTextField = 2
            print(checkTextField)

       }
        else if textField == self.cartypeTxtFld {
            viewTapped()

            self.typePicker.isHidden = false
            checkTextField = 3
            print(checkTextField)

        }
        else if textField == self.seatsTld {
            viewTapped()

            self.seatsPicker.isHidden = false
            checkTextField = 4
            print(checkTextField)

        }
        
        
//        else if textField == self.dateOfBirth {
//            self.birthOfDatePickerOutlet.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            self.birthOfDatePickerOutlet.isHidden = false
//            checkTextField = 5
//            print(checkTextField)
//
//        }
            
        else if textField == self.fromDateTF {
            viewTapped()
            
            self.fDatePicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.fDatePicker.isHidden = false
                self.checkTextField = 5
              print(checkTextField)
        }
            
        else if textField == self.toDateTF {
            viewTapped()

            self.tDatePicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.tDatePicker.isHidden = false
            self.checkTextField = 6
            print(checkTextField)
        }
            
        else if textField == self.departingTF {
            viewTapped()

            self.depatringTimePicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.depatringTimePicker.isHidden = false
            self.checkTextField = 7
            print(checkTextField)
        }
            
        else if textField == self.returnTF {
            viewTapped()

            self.retunringTimePicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.retunringTimePicker.isHidden = false
            self.checkTextField = 8
            print(checkTextField)
        }
    }


//    @IBAction func toDatePicker(_ sender: Any) {
//        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
//        if let day = components.day, let month = components.month, let year = components.year {
//            print("\(day) \(month) \(year)")
//            let toDate = "\(day) \(month) \(year)"
//            self.toDateTF.text = toDate
//            self.view.endEditing(true)
//            self.tDatePicker.isHidden = true
//
//        }
//    }
    
    @IBAction func fromDatePicker(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
                if let day = components.day, let month = components.month, let year = components.year {
                    print("\(day) \(month) \(year)")
                    let fromDate = "\(day) \(month) \(year)"
                    self.fromDateTF.text = fromDate
                    self.view.endEditing(true)
                    self.fDatePicker.isHidden = true
        }
        
    }
        @IBAction func taDatePicker(_ sender: UIDatePicker) { let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
            if let day = components.day, let month = components.month, let year = components.year {
                print("\(day) \(month) \(year)")
                let toDate = "\(day) \(month) \(year)"
                self.toDateTF.text = toDate
                self.view.endEditing(true)
                self.tDatePicker.isHidden = true
                
            }
    }
    
    
    @IBAction func deparinting(_ sender: UIDatePicker) {
       // let date = Date()
        
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: sender.date)
        if let hour = comp.hour , let minute = comp.minute {
            let time = "\(hour) : \(minute)"
        print(" \(hour) \(minute) ")
        self.departingTF.text = time
        self.view.endEditing(true)
        self.depatringTimePicker.isHidden = true
        }
    }
    
    
    @IBAction func returningPicker(_ sender: UIDatePicker) {
       // let date = Date()
        
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: sender.date)
        if   let hour = comp.hour , let minute = comp.minute {
            let time = "\(hour) : \(minute)"
        print(" \(hour) \(minute) ")
        self.returnTF.text = time
        self.view.endEditing(true)
            self.retunringTimePicker.isHidden = true
            
        }
        
    }

//    @IBAction func birthOfDatePicker(_ sender: UIDatePicker) {
//        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
//        if let day = components.day, let month = components.month, let year = components.year {
//            print("\(day) \(month) \(year)")
//            let dateOfBirth = "\(day) \(month) \(year)"
//            self.dateOfBirth.text = dateOfBirth
//            self.view.endEditing(true)
//            self.birthOfDatePickerOutlet.isHidden = true
//
//        }
//    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
       
dismissDetail()
        
    }
    
    
    @IBAction func nextBTNPressed(_ sender: UIButton) {
        //here we call the view controller by it's id not the segue id
        guard let offer  = storyboard?.instantiateViewController(withIdentifier: "OfferListVcID") else {
            return
        }
        //this part is belongs to guard condtion
        PresentDetail(offer)
    // self.performSegue(withIdentifier: "offerListSgu", sender: nil)
    }
    
    
    @objc func viewTapped(){
        carBrandTxtFld.endEditing(true)
        carModelTxtFld.endEditing(true)
        cartypeTxtFld.endEditing(true)
        seatsTld.endEditing(true)
        fromDateTF.endEditing(true)
        toDateTF.endEditing(true)
        departingTF.endEditing(true)
        returnTF.endEditing(true)

    
        self.fDatePicker.isHidden = true
        self.tDatePicker.isHidden = true
        self.depatringTimePicker.isHidden = true
        self.retunringTimePicker.isHidden = true
        self.brandPicker.isHidden = true
        self.modelPicker.isHidden = true
        self.typePicker.isHidden = true
        self.seatsPicker.isHidden = true

        print("hide keyBoard")
    }
    @objc func sideMenuIn(){
        UIView.animate(withDuration: 0.3) {
            self.containerLeading.constant = self.view.frame.size.width
            self.outerWidth.constant = 0
            self.inerWidth.constant = 0
            self.view.layoutIfNeeded()
            
        }
        
    }
        func sideMenuOut(){
            UIView.animate(withDuration: 0.3) {
                self.containerLeading.constant = 0
                self.outerWidth.constant = 240
                self.inerWidth.constant = 240
                self.view.layoutIfNeeded()
                
            }
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
            sideMenuIn()
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            sideMenuOut()
        }
       
    }
    
    
    
}
