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
    
    static let tamagotchiStory: [String] = ["배고파요.. 밥 주세요!", "밥 먹을 시간이에요!", "목이 너무 말라요.. 물 주세요!", "물 한잔만 주세요!", "오늘 깃허브 푸시 하셨어요?", "블로그 작성하셨어요?", "공부는 하고 계신가요?", "오늘 하루 코딩 열심히 해봐요!"]
    
    static let eatStory: [String] = [
        "우와! 밥 너무 맛있었어요~ 배불러요",
        "든든하게 먹었더니 힘이 불끈 나요!",
        "밥 잘 먹고 기분 최고예요!",
        "든든한 한 끼 감사합니다~ 잘 클 수 있을 것 같아요!",
        "밥 먹으니 행복지수 +100↑"
    ]
    
    static let drinkStory: [String] = [
        "꿀꺽꿀꺽~ 시원해요!",
        "목이 촉촉해졌어요",
        "물이 제일 맛있는 간식이에요~",
        "시원한 물 덕분에 더 튼튼해질 거예요!",
        "감사합니다! 생기가 돌아왔어요"
    ]
}
