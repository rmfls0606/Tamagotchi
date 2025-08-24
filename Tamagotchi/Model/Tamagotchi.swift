//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import Foundation

struct Tamagotchi{
    let imageName: String
    let name: String
    let introduction: String
}

struct TamagotchiData{
    static let tamagotchis: [Tamagotchi] = [
        Tamagotchi(imageName: "1-6", name: "따끔따끔 다마고치", introduction: "안녕, 난 뽀로로야."),
        Tamagotchi(imageName: "2-6", name: "방실방실 다마고치", introduction: "안녕, 난 고양이야."),
        Tamagotchi(imageName: "3-6", name: "반짝반짝 다마고치", introduction: "안녕, 난 펭귄이야."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다."),
        Tamagotchi(imageName: "noImage", name: "준비중이에요", introduction: "준비중입니다.")
    ]
}
