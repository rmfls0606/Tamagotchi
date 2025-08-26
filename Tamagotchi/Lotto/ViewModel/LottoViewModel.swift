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
        let showAlert: PublishRelay<Bool>
        let alertMessage: PublishRelay<String>
        let showToast: PublishRelay<Bool>
        let toastMessage: PublishRelay<String>
    }
    
    func transform(input: Input) -> Output {
        let lottoResponse = BehaviorRelay(value: "")
        let showAlert = PublishRelay<Bool>()
        let alertMessage = PublishRelay<String>()
        let showToast = PublishRelay<Bool>()
        let toastMessage = PublishRelay<String>()
        
        input.textFieldTap
            .withLatestFrom(input.textFieldText)
            .debounce(.microseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMap { value in
                CustomObservable.getLotto(draNo: value)
            }
            .subscribe(with: self) { owner, result in
                switch result{
                case .success(let lotto):
                    let result = "\(lotto.drwtNo1), \(lotto.drwtNo2), \(lotto.drwtNo3), \(lotto.drwtNo4), \(lotto.drwtNo5), \(lotto.drwtNo6)"
                    lottoResponse.accept(result)
                case .failure(let error):
                    if error == .networkNotConnected{
                        alertMessage.accept(error.errorDescription ?? "알 수 없는 오류가 발생하였습니다.")
                        showAlert.accept(true)
                    }else{
                        toastMessage.accept(error.errorDescription ?? "알 수 없는 오류가 발생하였습니다.")
                        showToast.accept(true)
                    }
                }
                
            } onError: { owner, error in
                print("onError", error)
            }
            .disposed(by: disposeBag)
        
        return Output(
            lottoResponse: lottoResponse,
            showAlert: showAlert,
            alertMessage: alertMessage,
            showToast: showToast,
            toastMessage: toastMessage
        )
    }
}
