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
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.text = UserManager.shared.currentUser?.nickName ?? "대장님"
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray2
        return view
    }()
    
    override func configureHierarchy() {
        
        nicknameTextField.addSubview(lineView)
        
        view.addSubview(nicknameTextField)
    }
    
    override func configureLayout() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "\(UserManager.shared.currentUser?.nickName ?? "대장님") 이름 정하기"
    }
}
