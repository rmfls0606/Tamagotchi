//
//  LottoViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation
import RxSwift
import RxCocoa

final class LottoViewModel: BaseViewModel{
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let textFieldTap: ControlEvent<Void>
        let textFieldText: ControlProperty<String>
    }
    
    struct Output{
        let lottoResponse: BehaviorRelay<String>
    }
    
    func transform(input: Input) -> Output {
        let lottoResponse = BehaviorRelay(value: "")
        
        input.textFieldTap
            .withLatestFrom(input.textFieldText)
            .distinctUntilChanged()
            .flatMap { value in
                CustomObservable.getLotto(draNo: value)
            }
            .retry(3)
            .subscribe(with: self) { owner, lotto in
                let result = "\(lotto.drwtNo1), \(lotto.drwtNo2), \(lotto.drwtNo3), \(lotto.drwtNo4), \(lotto.drwtNo5), \(lotto.drwtNo6)"
                lottoResponse.accept(result)
            } onError: { owner, error in
                print("onError", error)
            }
            .disposed(by: disposeBag)
        
        return Output(lottoResponse: lottoResponse)
    }
}
