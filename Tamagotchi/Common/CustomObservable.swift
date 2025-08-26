//
//  CustomObservable.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Foundation
import RxSwift
import RxCocoa

final class CustomObservable{
    
    static func getLotto(draNo: String) -> Observable<Result<Lotto,NetworkError>>{
        
        return Observable<Result<Lotto,NetworkError>>.create { observer in
            
            NetworkManager.shared.callRequest(api: LottoRouter.main(drwNo: draNo), type: Lotto.self) { response in
                observer.onNext(.success(response))
                observer.onCompleted()
            } failureHandler: { error in
                observer.onNext(.failure(error))
                observer.onCompleted()
            }

            return Disposables.create()
        }
    }
    
    static func getBoxOffice(targetDt: String) -> Observable<Result<BoxOffice,NetworkError>>{
        
        return Observable<Result<BoxOffice,NetworkError>>.create { observer in
            
            NetworkManager.shared.callRequest(api: BoxOfficeRouter.main(targetDt: targetDt), type: BoxOffice.self) { response in
                observer.onNext(.success(response))
                observer.onCompleted()
            } failureHandler: { error in
                observer.onNext(.failure(error))
                observer.onCompleted()
            }

            return Disposables.create()
        }
    }
}
