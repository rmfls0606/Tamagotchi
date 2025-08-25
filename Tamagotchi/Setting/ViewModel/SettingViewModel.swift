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
    private let itemRelay = BehaviorRelay<[Setting]>(value: [])
    
    struct Input {
        let cellItemSelected:  ControlEvent<IndexPath>
    }
    
    struct Output {
        let settingCellData: BehaviorRelay<[Setting]>
        let selectedInexPath: PublishRelay<Int>
    }
    
    init(){
        reloadItems()
    }
    
    func transform(input: Input) -> Output {
        let selectedInexPathRelay = PublishRelay<Int>()
        
        input.cellItemSelected
            .map{ $0.row }
            .bind(to: selectedInexPathRelay)
            .disposed(by: disposeBag)
            
        
        return Output(
            settingCellData: itemRelay,
            selectedInexPath: selectedInexPathRelay
        )
    }
    
    private func reloadItems(){
        let nickname = UserManager.shared.currentUser?.nickName ?? "대장님"
        itemRelay.accept([
            Setting(imageName:  "pencil", title: "내 이름 설정하기", detail: nickname),
            Setting(imageName:  "moon.fill", title: "다마고치 변경하기", detail: nil),
            Setting(imageName:  "arrow.clockwise", title: "데이터 초기화", detail: nil),
        ])
    }
    
    func updateNickname(nickname: String){
        var items = itemRelay.value
        items[0] = Setting(imageName: "pencil", title: "내 이름 설정하기", detail: nickname)
        itemRelay.accept(items)
    }
}
