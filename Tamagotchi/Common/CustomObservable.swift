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
    
    static func getLotto(draNo: String) -> Observable<Lotto>{
        
        return Observable<Lotto>.create { observer in
            
            NetworkManager.shared.callRequest(api: LottoRouter.main(drwNo: draNo), type: Lotto.self) { response in
                observer.onNext(response)
                observer.onCompleted()
            } failureHandler: { error in
                observer.onError(error)
            }

            return Disposables.create()
        }
    }
    
    static func getBoxOffice(targetDt: String) -> Observable<BoxOffice>{
        
        return Observable<BoxOffice>.create { observer in
            
            NetworkManager.shared.callRequest(api: BoxOfficeRouter.main(targetDt: targetDt), type: BoxOffice.self) { response in
                observer.onNext(response)
                observer.onCompleted()
            } failureHandler: { error in
                observer.onError(error)
            }

            return Disposables.create()
        }
    }
}
