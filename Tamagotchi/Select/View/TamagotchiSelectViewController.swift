//
//  TamagotchiSelectViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TamagotchiSelectViewController: BaseViewController {
    
    //MARK: - Property
    private let viewModel = TamagotchiSelectViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let cellCount = 3.0
        let spacing = 16.0
        let padding = 16.0
        
        let dimension = ((width - (padding * 2)) - (spacing * (cellCount - 1))) / cellCount
        
        layout.itemSize = CGSize(width: dimension, height: dimension * 1.4)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = spacing
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(TamagotchiSelectCollectionViewCell.self, forCellWithReuseIdentifier: TamagotchiSelectCollectionViewCell.identifier)
        return view
    }()
    
    override func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "다마고치 선택하기"
    }
    
    override func configureBind() {
        let input = TamagotchiSelectViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        output.tamagotchis
            .bind(to: collectionView.rx.items(cellIdentifier: TamagotchiSelectCollectionViewCell.identifier, cellType: TamagotchiSelectCollectionViewCell.self)){ item, element, cell in
                cell.tamagotchiImageView.image = UIImage(named: element.imageName)
                cell.tamagotchiNameLabel.text = element.name
            }
            .disposed(by: disposeBag)
    }
}
