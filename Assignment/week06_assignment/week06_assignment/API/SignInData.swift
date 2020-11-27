//
//  SignInData.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/21.


import Foundation


// 로그인에 성공했을 때 받아올 타입 생성
// MARK: - DataClass
struct SignInData: Codable {
    let email, password, userName: String
}
