//
//  SetNicknameViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SetNicknameViewController: BaseViewController {
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "\(UserManager.shared.currentUser?.nickName ?? "대장님") 이름 정하기"
    }
}
