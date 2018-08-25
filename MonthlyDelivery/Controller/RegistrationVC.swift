//
//  RegistrationVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 6/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit
import SVProgressHUD
class RegistrationVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate
 ,UITextFieldDelegate {
   
    
// outlet
    
    @IBOutlet weak var registrationSideMenuBTN: UIButton!
    
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var fristnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var nationalityTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    
    @IBOutlet weak var femaleCheckBox: UIImageView!
    @IBOutlet weak var maleCheckBox: UIImageView!
    
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    
    
    // variables
    var userGender = "male"
    var mobileToken = "lkkckwoewoifnreinwofn"
    var base64String : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // to hide KeyBoard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
        
      
        dateOfBirthTF.delegate = self
        // circel image
           profileIMG.layer.cornerRadius = profileIMG.frame.height / 2.0
            profileIMG.layer.masksToBounds = true
        
            
    }
   
    
    @IBAction func femaleBTNPressed(_ sender: UIButton) {
        userGender = "female"
        femaleCheckBox.image = UIImage(named: "checked")
        maleCheckBox.image = UIImage(named: "unchecked")
    }
    
    @IBAction func maleBTNPressed(_ sender: UIButton) {
        userGender = "male"
        maleCheckBox.image = UIImage(named: "checked")
        femaleCheckBox.image = UIImage(named: "unchecked")
    }
    

    @IBAction func backLoginBtnpressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func loginAsUserBtnPressed(_ sender: Any) {
        
        SVProgressHUD.show()

        guard let fname = fristnameTF.text , fristnameTF.text != "" else { return }
        guard let lname = lastnameTF.text , lastnameTF.text != "" else { return }
        guard let mobile = mobileNumberTF.text , mobileNumberTF.text != "" else { return }
        // guard let gender = userGender , userGender != "" else { return }
        guard let email = emailTF.text , emailTF.text != "" else { return }
        guard let pass = passwordTF.text , passwordTF.text != "" else { return }
        guard let address = addressTF.text , addressTF.text != "" else { return }
        guard let nationality = nationalityTF.text , nationalityTF.text != "" else { return }
        guard let birthDate = dateOfBirthTF.text , dateOfBirthTF.text != "" else { return }
       //  guard let profileImage = profileIMG.image , profileIMG.image != nil else { return }
        // guard let deviceToken = mobileToken , mobileToken != "" else { return }
         guard let profileImageString = base64String , base64String != "" else { return }

        AuthSevice.instance.registerUser(fristName: fname, lastName: lname, address: address, gender:userGender , birthDate: birthDate, mobile: mobile, email: email, password: pass, nationality: nationality, profileImage: profileImageString, deviceToken: mobileToken) { (success) in
            if success {
                
                print("go ahead  ")
            }
        }
       SVProgressHUD.dismiss()
        performSegue(withIdentifier: "createAsAclientsgu", sender: nil)
    }
    
    
    @IBAction func profileImgBtnPressed(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        profileIMG.image = image
        
//        print(info[UIImagePickerControllerImageURL]!)
//        guard let fileUrl = info[UIImagePickerControllerImageURL] as? URL else{return}
//        localImageUrl = (fileUrl.absoluteString)
        
        // to convert image to Base64 String
        
        if profileIMG.image != nil {
            let image : UIImage = profileIMG.image!
            let imageData : NSData = (UIImageJPEGRepresentation(image, 1.0) as NSData?)!
            base64String = imageData.base64EncodedString(options: .lineLength64Characters)
 //  print("..........................\(base64String)")
        }else{
            print("error .............")
           // self.alertErrorPop(title: "Error", message: "Please Make Sure With Your photo")
            return
        }
//        localImageUrl = (info[UIImagePickerControllerImageURL] as? String)!
        dismiss(animated: true, completion: nil)
    }
    
    @objc func viewTapped(){
        fristnameTF.endEditing(true)
        lastnameTF.endEditing(true)
        mobileNumberTF.endEditing(true)
        emailTF.endEditing(true)
        passwordTF.endEditing(true)
        addressTF.endEditing(true)
        nationalityTF.endEditing(true)

      print("hide keyBoard")
    }
    @IBAction func dateOfBirthPicker(_ sender: UIDatePicker) {
        
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let dateOfBirth = "\(day) \(month) \(year)"
            self.dateOfBirthTF.text = dateOfBirth
            self.view.endEditing(true)
            self.dateOfBirth.isHidden = true
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.dateOfBirthTF {
            self.dateOfBirth.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.dateOfBirth.isHidden = false
            self.dateOfBirthTF.endEditing(true)
                    }
    }
   
    
}
