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
    
    //MARK: -  Property
    private let viewModel = SetNicknameViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - View
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
    
    private let nicknameValidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override func configureHierarchy() {
        
        nicknameTextField.addSubview(lineView)
        
        view.addSubview(nicknameTextField)
        view.addSubview(nicknameValidLabel)
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
        
        nicknameValidLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "\(UserManager.shared.currentUser?.nickName ?? "대장님") 이름 정하기"
        let rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func configureBind() {
        let input = SetNicknameViewModel.Input(
            nickname: nicknameTextField.rx.text.orEmpty,
            saveButtonTap: navigationItem.rightBarButtonItem?.rx.tap
        )
        
        let output = viewModel.transform(input: input)
        
        output.nicknameValid
            .bind(with: self) { owner, valid in
                if valid{
                    owner.nicknameValidLabel.text = "사용할 수 있는 닉네임입니다."
                    owner.nicknameValidLabel.textColor = .green
                }else{
                    owner.nicknameValidLabel.text = "2글자 이상 6글자 이하로 입력해주세요.."
                    owner.nicknameValidLabel.textColor = .red
                }
            }
            .disposed(by: disposeBag)
        
        output.submitEnabled
            .bind(with: self, onNext: { owner, isEnabled in
                if let button = owner.navigationItem.rightBarButtonItem{
                    button.isEnabled = isEnabled
                }
            })
            .disposed(by: disposeBag)
        
        output.saveNickname
            .bind(with: self) { owner, _ in
                owner.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
    }
}
