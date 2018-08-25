//
//  ProfileVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 6/13/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController , UITextFieldDelegate ,  UIImagePickerControllerDelegate , UINavigationControllerDelegate{
// outlel
    
    
    
    
    @IBOutlet weak var changeProfileImgBtn: UIButton!
    @IBOutlet weak var profileImgToChange: UIImageView!
    
    @IBOutlet weak var profileSideMenuBTN: UIButton!
    
    @IBOutlet weak var fNmae: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var base64String : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        fNmae.delegate = self
        lName.delegate = self
        mobile.delegate = self
        email.delegate = self
        password.delegate = self
        
        self.fNmae.isEnabled = false
        self.lName.isEnabled = false
        self.mobile.isEnabled = false
        self.email.isEnabled = false
        self.password.isEnabled = false
        self.changeProfileImgBtn.isEnabled = false
        
        
        profileSideMenuBTN.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        // to hide KeyBoard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
        
        profileImgToChange.layer.cornerRadius = profileImgToChange.frame.height / 2.0
        profileImgToChange.layer.masksToBounds = true
    }

    
    @IBAction func backToLoginBtnPressed(_ sender: Any) {
      performSegue(withIdentifier: "exitTologin", sender: nil)
    }
    func FieldEndEditing (_ textField: UITextField){
        textField.endEditing(true)
        
    }
    
        @IBAction func enableBTNPressed(_ sender: UIButton) {
            self.fNmae.isEnabled = true
            self.lName.isEnabled = true
            self.mobile.isEnabled = true
            self.email.isEnabled = true
            self.password.isEnabled = true
            self.changeProfileImgBtn.isEnabled = true
        
    }
    
    @IBAction func changeprofileImgBtnPressed(_ sender: UIButton) {
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
        profileImgToChange.image = image
        
        //        print(info[UIImagePickerControllerImageURL]!)
        //        guard let fileUrl = info[UIImagePickerControllerImageURL] as? URL else{return}
        //        localImageUrl = (fileUrl.absoluteString)
        
        // to convert image to Base64 String
        
        if profileImgToChange.image != nil {
            let image : UIImage = profileImgToChange.image!
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
        fNmae.endEditing(true)
        lName.endEditing(true)
        mobile.endEditing(true)
        email.endEditing(true)
        password.endEditing(true)
      
    
        print("hide keyBoard")
    }
    
}
