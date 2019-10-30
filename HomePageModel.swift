//
//  HomePageModel.swift
//  SampleTest
//
//  Created by Spandana Nayakanti on 6/21/19.
//  Copyright © 2019 Spandana. All rights reserved.
//

import UIKit

class HomePageModel: NSObject {
    
    struct User {
        var firstName:String
        var lastName : String
        var phoneNumber : String
        
        init(firstName: String, lastName:String, phoneNumber: String) {
            self.firstName = firstName
            self.lastName = lastName
            self.phoneNumber = phoneNumber
        }
        
        static func getUserDataWith(array:[Dictionary<String,Any>]) -> [User] {
            var userDataArray: [User] = []
            for dict in array {
                var phoneNum = ""
                if let contact = dict["contact"] as? [String : Any] {
                    if let phoneNumber = contact["phone"] as? String {
                        phoneNum = phoneNumber
                    }
                }
                let user = User(firstName: dict["fname"] as! String, lastName: dict["lname"] as! String, phoneNumber: phoneNum)
                userDataArray.append(user)
            }
            return userDataArray
        }
    }
    
}
