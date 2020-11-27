//
//  AuthService.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/27.
//

import Foundation
import Alamofire

//로그인 서버 통신 구현을 위한 구조체

struct AuthService {
    static let shared = AuthService() // 싱글톤 객체로 앱 어디서든 접근 가능 특정용도롤 객체를 하나 생성하여 공용으로 사용하고 싶을때 사용
    // 여러객체에서 접근가능하도록 데이터를 사용하는 것이다. 프로그램 내에서 단 하나의 인스턴스로만 클래스를 관리하고 사용할 수 있다.
    //생성되고 나면 프로그램 종료시까지 항상 메모리에 올라가 있으므로 적절하게 사용해야 한다
    
    func signUp(email: String,
                password: String,
                userName: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.usersSignUpURL //signup url
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ] //요청 헤더
        
        let body: Parameters = [
            "email": email,
            "password": password,
            "userName": userName
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
                                    
        dataRequest.responseData{ (response) in
            
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeSignUpData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
    }
    
    
    // 로그인 통신에 대한 함수 정의
    func signIn(email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.usersSignInURL // 통신 url
        
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ] // 요청 헤더
        
        let body: Parameters = [
            "email" : email,
            "password" : password
        ] //요청 바디
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData{ (response) in
            
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return //통신의 결과에 따랄 statusCode와 value를 가지게 된다.
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        
        
    }
    
    private func judgeSignUpData(status: Int, data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignUpData>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignInData>.self, from: data) else {
            return .pathErr //통신을 통해 전달받은 데이터를 decode
        }
        
        //statusCode를 통해 통신 결과를 알 수 있다.
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message) //통신에는 성공했지만, 요청값에 대한 오류 처리 오류결과와 함께 오류 메세지를 전달한다.
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
        
        
    }
    
}
