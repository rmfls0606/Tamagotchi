//
//  NetworkError.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation
import Alamofire

enum NetworkError: LocalizedError{
    case badRequest
    case unAuthorized
    case forbidden
    case notFound
    case serverError
    case networkNotConnected
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "잘못된 요청입니다."
        case .unAuthorized:
            return "유효하지 않은 접근입니다."
        case .forbidden:
            return "권한이 없습니다."
        case .notFound:
            return "요청한 리소스를 찾을 수 없습니다."
        case .serverError:
            return "서버 오류가 발생하였습니다."
        case .networkNotConnected:
            return "네트워크에 연결할 수 없습니다.\n인터넷을 확인해주세요."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
    
    static func mapping(
        error: AFError?,
        response: HTTPURLResponse?
    ) -> NetworkError{
        if let afError = error,
           let urlError = afError.underlyingError as? URLError,
           urlError.code == .notConnectedToInternet{
            return .networkNotConnected
        }
        
        if let statusCode = response?.statusCode{
            switch statusCode{
            case 400: return .badRequest
            case 401: return .unAuthorized
            case 403: return .forbidden
            case 404: return .notFound
            case 500, 503: return .serverError
            default: break
            }
        }
        
        return .unknown
    }
}
