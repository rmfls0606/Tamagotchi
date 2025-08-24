//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MainViewController: BaseViewController {
    
    //MARK: - Property
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - View
    private let tamagotchiStoryImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bubble")
        return view
    }()
    
    private let tamagotchiStoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 5
        label.text = "안녕하세요!"
        label.textAlignment = .center
        return label
    }()
    
    private let tamagotchiImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: UserManager.shared.currentUser?.imageName ?? "noImage")
        return view
    }()
    
    private let tamagotchiNameLabelBox: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private var tamagotchiNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.text = UserManager.shared.currentUser?.name ?? "준비중이에요"
        label.textAlignment = .center
        return label
    }()
    
    private let tamagotchiInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Lv\(UserManager.shared.currentUser?.level ?? 1)·밥알 \(UserManager.shared.currentUser?.riceCount ?? 0)개·물방울 \(UserManager.shared.currentUser?.waterCount ?? 0)개"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let riceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private let riceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "밥주세용"
        textField.font = .systemFont(ofSize: 14)
        textField.textAlignment = .center
        return textField
    }()
    
    private let riceUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray4
        return view
    }()
    
    private let riceEatButton: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.bordered()
        var imageConfig = UIImage.SymbolConfiguration(scale: .medium)
        config.attributedTitle = AttributedString("밥먹기", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14)
        ]))
        config.preferredSymbolConfigurationForImage = imageConfig
        config.image = UIImage(systemName: "drop.circle")
        config.imagePlacement = .leading
        config.imagePadding = 4
        config.background.cornerRadius = 10
        config.background.strokeColor = UIColor.black
        config.background.strokeWidth = 1.0
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        btn.configuration = config
        return btn
    }()
    
    private let waterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private let waterTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "물주세용"
        textField.font = .systemFont(ofSize: 14)
        textField.textAlignment = .center
        return textField
    }()
    
    private let waterUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray4
        return view
    }()
    
    private let waterDrinkButton: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.bordered()
        var imageConfig = UIImage.SymbolConfiguration(scale: .medium)
        config.attributedTitle = AttributedString("물먹기", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14)
        ]))
        config.preferredSymbolConfigurationForImage = imageConfig
        config.image = UIImage(systemName: "leaf.circle")
        config.imagePlacement = .leading
        config.imagePadding = 4
        config.background.cornerRadius = 10
        config.background.strokeColor = UIColor.black
        config.background.strokeWidth = 1.0
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        btn.configuration = config
        return btn
    }()

    
    override func configureHierarchy() {
        view.addSubview(tamagotchiStoryImageView)
        view.addSubview(tamagotchiStoryLabel)
        view.addSubview(tamagotchiImageView)
        
        tamagotchiNameLabelBox.addSubview(tamagotchiNameLabel)
        view.addSubview(tamagotchiNameLabelBox)
        view.addSubview(tamagotchiInfoLabel)
        
        riceTextField.addSubview(riceUnderLineView)
        riceStackView.addArrangedSubview(riceTextField)
        riceStackView.addArrangedSubview(riceEatButton)
        view.addSubview(riceStackView)
        
        waterTextField.addSubview(waterUnderLineView)
        waterStackView.addArrangedSubview(waterTextField)
        waterStackView.addArrangedSubview(waterDrinkButton)
        view.addSubview(waterStackView)
    }
    
    override func configureLayout() {
        tamagotchiStoryImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        tamagotchiStoryLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(tamagotchiStoryImageView).inset(16)
            make.verticalEdges.equalTo(tamagotchiStoryImageView).inset(20)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiStoryImageView.snp.bottom).offset(8)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(UIScreen.main.bounds.width * 0.5)
        }
        
        tamagotchiNameLabelBox.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(8)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        tamagotchiNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        tamagotchiInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiNameLabelBox.snp.bottom).offset(8)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiInfoLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        riceUnderLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        waterStackView.snp.makeConstraints { make in
            make.top.equalTo(riceStackView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        waterUnderLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "\(UserManager.shared.currentUser?.name ?? "대장")님의 다마고치"
    }
    
    override func configureBind() {
        let input = MainViewModel.Input(
            riceEatButtonTapped: riceEatButton.rx.tap,
            riceValue: riceTextField.rx.text.orEmpty,
            waterDrinkButtonTapped: waterDrinkButton.rx.tap,
            waterCount: waterTextField.rx.text.orEmpty)
        
        let output = viewModel.transform(input: input)
        
        output.user
            .bind(with: self) { owner, user in
                owner.tamagotchiImageView.image = UIImage(named: user.imageName)
                owner.tamagotchiInfoLabel.text = "Lv\(user.level)·밥알 \(user.riceCount)개·물방울 \(user.waterCount)개"
            }
            .disposed(by: disposeBag)
    }
}
