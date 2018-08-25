//
//  LogInVC.swift
//  MonthlyDelivery
//
//  Created by Ibrahim Attalla on 6/11/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import UIKit

class LogInVC: UIViewController   {
    
// unwind func
    @IBAction func prepapareForUnwind(segue:UIStoryboardSegue){}

    // outlet
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)


       
    }
    
    @IBAction func logInBtnPressed(_ sender: Any) {
        
//        guard let email = emailTF.text , emailTF.text != "" else{return}
//        guard let password = passwordTF.text , passwordTF.text != "" else{return}
//        
//        AuthSevice.instance.loginUser(email: email, password: password) { (success) in
//            if success {
//                print("user loggedIn")
//            }else{
//                print("error")
//            }
//
//        }

      //  performSegue(withIdentifier: "homeSgu", sender: nil)
        
        //here we call the view controller by it's id not the segue id
        guard let home  = storyboard?.instantiateViewController(withIdentifier: "HomeVcID") else {
            return
        }
        //this part is belongs to guard condtion
        PresentDetail(home)
    }
    
    @IBAction func dontHaveAccntBtnPressed(_ sender: Any) {
        //here we call the view controller by it's id not the segue id
        guard let registarVC  = storyboard?.instantiateViewController(withIdentifier: "RegistrationVcID") else {
            return
        }
        //this part is belongs to guard condtion
        PresentDetail(registarVC)
    }
    
    @IBAction func forgetPasswordTF(_ sender: UIButton) {
        
    }
    
    @objc func viewTapped(){
        emailTF.endEditing(true)
        passwordTF.endEditing(true)

        print("hide KeyBoard")
    }
    

    
}

