//
//  LottoViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class LottoViewController: BaseViewController {
    
    //MARK: - Property
    private let viewModel = LottoViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - View
    private let textField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "회차를 입력해주세요..."
//        view.keyboardType = .numberPad
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func configureHierarchy() {
        view.addSubview(textField)
        view.addSubview(resultLabel)
    }
    
    override func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "Lotto"
    }
    
    override func configureBind() {
        let input = LottoViewModel.Input(
            textFieldTap: textField.rx.controlEvent(.editingDidEndOnExit),
            textFieldText: textField.rx.text.orEmpty
        )
        
        let output = viewModel.transform(input: input)
        
        output.lottoResponse
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.showAlert
            .withLatestFrom(output.alertMessage)
            .bind(with: self) { owner, message in
                owner.showAlert(title: "오류발생", message: message) {
                    
                }
            }
            .disposed(by: disposeBag)
    }
}
