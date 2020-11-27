//
//  APIConstants.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/21.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://15.164.83.210:3000"
    //login URL
    static let usersSignInURL = baseURL + "/users/signin"
    
    // sign up URL
    static let usersSignUpURL = baseURL + "/users/signup"
}


//Static Variables are belong to a type rather than to instance of class.
//You can access the static variable by using the full name of the type.
