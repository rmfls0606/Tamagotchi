//
//  SettingViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SettingViewModel {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        
    }
    
    struct Output {
        let settingCellData: BehaviorRelay<[Setting]>
    }
    
    func transform(input: Input) -> Output {
        let settingCellDataRelay = BehaviorRelay<[Setting]>(value: [])
        
        settingCellDataRelay.accept([
           Setting(imageName:  "pencil", title: "내 이름 설정하기", detail: UserManager.shared.currentUser?.nickName ?? "대장님"),
           Setting(imageName:  "moon.fill", title: "다마고치 변경하기", detail: nil),
           Setting(imageName:  "arrow.clockwise", title: "데이터 초기화", detail: nil),
        ])
        
        return Output(settingCellData: settingCellDataRelay)
    }
}
