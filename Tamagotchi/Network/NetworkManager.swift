//
//  NetworkManager.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Alamofire

final class NetworkManager{
    static let shared = NetworkManager()
    
    private init(){}
    
    func callRequest<T: Decodable>(api: LottoRouter, type: T.Type, successHandler: @escaping (T) -> Void, failureHandler: @escaping (Error) -> Void){
        AF.request(api.endPoint, method: api.method, parameters: api.parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: type.self) { response in
                switch response.result {
                case .success(let value):
                    successHandler(value)
                case .failure(let error):
                    failureHandler(error)
                }
            }
    }
}
