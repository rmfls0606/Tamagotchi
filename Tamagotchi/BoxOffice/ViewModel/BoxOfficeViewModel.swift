//
//  BoxOfficeViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation
import RxSwift
import RxCocoa

final class BoxOfficeViewModel: BaseViewModel{
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let searchTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output{
        let boxOfficeList: BehaviorRelay<[DailyBoxOfficeList]>
        let showAlert: PublishRelay<Bool>
        let alertMessage: PublishRelay<String>
        let showToast: PublishRelay<Bool>
        let toastMessage: PublishRelay<String>
    }
    
    func transform(input: Input) -> Output {
        let boxOfficeList = BehaviorRelay<[DailyBoxOfficeList]>(value: [])
        let showAlert = PublishRelay<Bool>()
        let alertMessage = PublishRelay<String>()
        let showToast = PublishRelay<Bool>()
        let toastMessage = PublishRelay<String>()
        
        input.searchTap
            .withLatestFrom(input.searchText)
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMap({ value in
                CustomObservable.getBoxOffice(targetDt: value)
            })
            .subscribe(with: self) { owner, result in
                switch result{
                case .success(let value):
                    boxOfficeList
                        .accept(value.boxOfficeResult.dailyBoxOfficeList)
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
            boxOfficeList: boxOfficeList,
            showAlert: showAlert,
            alertMessage: alertMessage,
            showToast: showToast,
            toastMessage: toastMessage
        )
    }
}
