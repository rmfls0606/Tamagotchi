//
//  MainViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel {
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let riceEatButtonTapped: ControlEvent<Void>
        let riceValue: ControlProperty<String>
        let waterDrinkButtonTapped: ControlEvent<Void>
        let waterCount: ControlProperty<String>
    }
    
    struct Output{
        let user: PublishRelay<User>
        let story: PublishRelay<String>
    }
    
    func transform(input: Input) -> Output {
        let userRelay = PublishRelay<User>()
        let storyRelay = PublishRelay<String>()
        
        input.riceEatButtonTapped
            .withLatestFrom(input.riceValue)
            .map { value in
                guard let value = Int(value), !String(value).isEmpty else { return 1}
                
                if value >= 1 && value <= 99{
                    return value
                }
                return 0
            }
            .bind(with: self) { owner, value in
                if let currntUser = UserManager.shared.currentUser, value != 0{
                    let newRiceCount = currntUser.riceCount + value
                    let level = owner.calculateLevel(rice: newRiceCount, water: currntUser.waterCount)
                    let imageNumber = min(level, 9)
                    
                    var newUser = currntUser
                    newUser.imageName = "\(currntUser.imageName.prefix(1))-\(imageNumber)"
                    newUser.riceCount = newRiceCount
                    newUser.level = level
                    UserManager.shared.updateUser(newUser: newUser)
                    userRelay.accept(newUser)
                    storyRelay.accept(TamagotchiData.eatStory.randomElement() ?? "감사해요~!")
                }
            }
            .disposed(by: disposeBag)
        
        input.waterDrinkButtonTapped
            .withLatestFrom(input.waterCount)
            .map { value in
                guard let value = Int(value), !String(value).isEmpty else { return 1}
                
                if value >= 1 && value <= 49{
                    return value
                }
                return 0
            }
            .bind(with: self) { owner, value in
                if let currntUser = UserManager.shared.currentUser, value != 0{
                    let newWaterCount = currntUser.waterCount + value
                    let level = owner.calculateLevel(rice: currntUser.riceCount, water: newWaterCount)
                    let imageNumber = min(level, 9)
                    
                    var newUser = currntUser
                    newUser.imageName = "\(currntUser.imageName.prefix(1))-\(imageNumber)"
                    newUser.waterCount = newWaterCount
                    newUser.level = level
                    UserManager.shared.updateUser(newUser: newUser)
                    userRelay.accept(newUser)
                    storyRelay.accept(TamagotchiData.drinkStory.randomElement() ?? "감사해요~!")
                }
            }
            .disposed(by: disposeBag)
        
        return Output(user: userRelay, story: storyRelay)
    }
    
    private func calculateLevel(rice: Int, water: Int) -> Int {
        let value = max(1, ((rice / 5) + (water / 2)) / 10)
        return min(value, 10)
    }
}
