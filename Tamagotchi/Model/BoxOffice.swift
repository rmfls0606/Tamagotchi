//
//  BoxOffice.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation

struct BoxOffice: Decodable{
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable{
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable{
    let movieNm: String
}
