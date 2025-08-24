//
//  TamagotchiSelectViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import Foundation
import RxSwift
import RxCocoa

final class TamagotchiSelectViewModel {
    
    struct Input{
        
    }
    
    struct Output{
        var tamagotchis: BehaviorRelay<[Tamagotchi]>
    }
    
    func transform(input: Input) -> Output {
        let tamagotchis = BehaviorRelay<[Tamagotchi]>(value: [])
        
        tamagotchis.accept(TamagotchiData.tamagotchis)
        
        return Output(tamagotchis: tamagotchis)
    }
}
