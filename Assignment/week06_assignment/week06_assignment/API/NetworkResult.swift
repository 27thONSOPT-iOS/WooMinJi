//
//  NetworkResult.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/21.
//

import Foundation

//서버 통신에 따른 결과 : 성공, 요청에러, 경로에러, 서버 내부 에러, 네트워크 연결 실패
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
