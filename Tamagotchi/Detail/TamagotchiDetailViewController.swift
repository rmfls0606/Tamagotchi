//
//  TamagotchiDetailViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TamagotchiDetailViewController: BaseViewController {
    
    //MARK: - Property
    var selectedTamagotchi: Tamagotchi?
    private let disposeBag = DisposeBag()
    
    //MARK: - View
    private let MainBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let tamagotchiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "noImage")
        return imageView
    }()
    
    private let tamagotchiNameLabelBox: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private(set) var tamagotchiNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "준비중이에요"
        label.textAlignment = .center
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let introductionTextView: UITextView = {
        let view = UITextView()
        view.isScrollEnabled = false
        view.text = "준비중입니다."
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    private let buttonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("취소", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14)
        ]))
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        button.backgroundColor = .systemGray6
        button.configuration = config
        return button
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("시작 ", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14)
        ]))
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        button.configuration = config
        return button
    }()
    
    override func configureHierarchy() {
        MainBoxView.addSubview(tamagotchiImageView)
        
        tamagotchiNameLabelBox.addSubview(tamagotchiNameLabel)
        MainBoxView.addSubview(tamagotchiNameLabelBox)
        
        MainBoxView.addSubview(lineView)
        
        MainBoxView.addSubview(introductionTextView)
        
        MainBoxView.addSubview(buttonLineView)
        
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(startButton)
        
        MainBoxView.addSubview(buttonStackView)
        
        view.addSubview(MainBoxView)
    }
    
    override func configureLayout() {
        MainBoxView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width * 0.8)
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(MainBoxView.snp.width).multipliedBy(0.4)
        }
        
        tamagotchiNameLabelBox.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        tamagotchiNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(tamagotchiNameLabelBox.snp.bottom).offset(24)
            
        }
        
        introductionTextView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        buttonLineView.snp.makeConstraints { make in
            make.top.equalTo(introductionTextView.snp.bottom).offset(24)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(buttonLineView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        view.backgroundColor = .darkGray.withAlphaComponent(0.8)
        
        if let tamagotchi = selectedTamagotchi {
            tamagotchiImageView.image = UIImage(named: tamagotchi.imageName)
            tamagotchiNameLabel.text = tamagotchi.name
            introductionTextView.text = tamagotchi.introduction
        }
    }
    
    override func configureBind() {
        cancelButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        startButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                UserManager.shared.createUser(imageName: owner.selectedTamagotchi?.imageName ?? "noImage", introduction: owner.selectedTamagotchi?.introduction ?? "준비 중 입니다.")
                
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
                
                sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
                sceneDelegate.window?.makeKeyAndVisible()
            }
            .disposed(by: disposeBag)
    }
}
