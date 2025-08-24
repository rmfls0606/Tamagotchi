//
//  SetNicknameViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SetNicknameViewModel {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let nickname: ControlProperty<String>
        let saveButtonTap: ControlEvent<Void>?
    }
    
    struct Output {
        let nicknameValid: Observable<Bool>
        let submitEnabled: Observable<Bool>
        let saveNickname: PublishRelay<Void>
    }
    
    func transform(input: Input) -> Output {
        let saveNicknameRelay = PublishRelay<Void>()
        
        let nicknameValid = input.nickname
            .map{ $0.count >= 2 && $0.count <= 6}
        
        let submitEnable = nicknameValid
        
        if let saveButtonTap = input.saveButtonTap {
            saveButtonTap
                .withLatestFrom(input.nickname)
                .bind { nickname in
                    UserManager.shared.updateNickname(nickname: nickname)
                    saveNicknameRelay.accept(())
                }
                .disposed(by: disposeBag)
        }
        
        return Output(
            nicknameValid: nicknameValid,
            submitEnabled: submitEnable,
            saveNickname: saveNicknameRelay
        )
    }
}
