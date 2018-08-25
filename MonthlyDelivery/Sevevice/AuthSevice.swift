//
//  AuthSevice.swift
//  MonthlyDelivery
//
//  Created by repo on 6/27/18.
//  Copyright © 2018 Ibrahim Attalla. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthSevice {
    
    static let instance = AuthSevice()
    let defaults = UserDefaults.standard
    
    // some variables
    
    var authToken : String {
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    
    var userEmail :String{
        get{
            return defaults.value(forKey: USER_EMAIL)  as! String       }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    
    func registerUser(fristName:String , lastName: String, address: String , gender: String, birthDate: String, mobile: String , email: String, password: String, nationality: String, profileImage: String, deviceToken: String ,completion: @escaping completionHandler){
        let lowerCaseEmail = email.lowercased()
        //"email":lowerCaseEmail , "password":password
        let body : [String : Any] = [ "CL_First_Name":fristName,"CL_Last_Name":lastName,"CL_Address":address,"CL_Gender":gender,"CL_BirthDate":birthDate,"CL_Mobile":mobile,"CL_Email":lowerCaseEmail,"CL_Password":password,"CL_Nationality":nationality,"CL_Profile_Image":profileImage,"CL_Device_Token":deviceToken]
        
        let  header = ["Content-Type": "application/json; charset=utf-8"]
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header ).responseString { (response) in
            if response.result.error == nil{
                print("..................good")
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    func loginUser (email: String , password: String , completion : @escaping completionHandler){
        
        let lowerCaseEmail = email.lowercased()
        let body : [String : Any] = ["email":lowerCaseEmail , "password":password]
        
        Alamofire.request(URL_LOGGEDIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else{return}
                let json = JSON(data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["taken"].stringValue
                print("getting data 2")
                print(self.authToken)
                completion(true)
                
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
}
