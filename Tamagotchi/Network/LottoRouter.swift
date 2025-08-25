//
//  LottoRouter.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Foundation
import Alamofire

enum LottoRouter {
    case main(drwNo: String)
    
    var endPoint: URL {
        switch self {
        case .main:
            return URL(string: NetworkURL.lottoURL)!
        }
    }
    
    var parameters: [String: Any]{
        switch self {
        case .main(let drwNo):
            ["drwNo": drwNo]
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
}
