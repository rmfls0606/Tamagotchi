//
//  RouterProtocol.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation
import Alamofire

protocol RouterProtocol{
    var endPoint: URL { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
}
