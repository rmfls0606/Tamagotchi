//
//  LottoViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit
import SnapKit

final class LottoViewController: BaseViewController {
    
    private let textField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "회차를 입력해주세요..."
        view.keyboardType = .numberPad
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "결과가 없습니다."
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
}
