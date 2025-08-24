//
//  TamagotchiSelectViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit
import SnapKit

final class TamagotchiSelectViewController: BaseViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let cellCount = 3.0
        let spacig = 16.0
        let padding = 16.0
        
        let dimension = ((width - (padding * 2)) - (spacig * (cellCount - 1))) / cellCount
        
        layout.estimatedItemSize = CGSize(width: dimension, height: dimension)
        layout.minimumLineSpacing = spacig
        layout.minimumInteritemSpacing = spacig
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
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
}
