//
//  BoxOfficeRouter.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation
import Alamofire

enum BoxOfficeRouter: RouterProtocol {
    case main(targetDt: String)
    
    var endPoint: URL{
        switch self {
        case .main(let targetDt):
            return URL(string: NetworkURL.boxOfficeURL)!
        }
    }
    
    var parameters: [String : Any]{
        switch self {
        case .main(targetDt: let targetDt):
            return ["targetDt": targetDt, "key": APIKey.boxOfficeKey]
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
}
