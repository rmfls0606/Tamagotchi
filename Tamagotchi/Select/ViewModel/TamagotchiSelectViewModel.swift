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
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let cellSelected: ControlEvent<Tamagotchi>
    }
    
    struct Output{
        var tamagotchis: BehaviorRelay<[Tamagotchi]>
        var selectedTamagotchi: PublishRelay<Tamagotchi>
    }
    
    func transform(input: Input) -> Output {
        let tamagotchis = BehaviorRelay<[Tamagotchi]>(value: [])
        let tamagotchi = PublishRelay<Tamagotchi>()
        
        tamagotchis.accept(TamagotchiData.tamagotchis)
        
        input.cellSelected
            .asDriver()
            .drive { tamagotch in
                tamagotchi.accept(tamagotch)
            }
            .disposed(by: disposeBag)
        
        return Output(
            tamagotchis: tamagotchis,
            selectedTamagotchi: tamagotchi
        )
    }
}
