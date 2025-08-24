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
        Tamagotchi(imageName: "1-6", name: "따끔따끔 다마고치", introduction: "저는 따끔따끔 다마고치입니당 키는 120km 몸무게는 160톤이에용 성격은 다소 장난꾸러기지만 은근히 따뜻하답니당~! 가끔 따끔하게 놀라게 할 수도 있지만, 누구보다 친구들을 아끼는 마음이 크답니당 따끔따끔!"),
        Tamagotchi(imageName: "2-6", name: "방실방실 다마고치", introduction: "저는 방실방실 다마고치입니당 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"),
        Tamagotchi(imageName: "3-6", name: "반짝반짝 다마고치", introduction: "저는 반짝반짝 다마고치입니당 키는 100km 몸무게는 120톤이에용 성격은 언제나 긍정적이고 반짝이는 아이디어가 넘쳐흐른답니당~! 별빛처럼 주변을 환하게 만드는 게 특기예용. 잘 먹고, 잘 뛰어다니면서 더 반짝반짝 성장할 거예요"),
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
