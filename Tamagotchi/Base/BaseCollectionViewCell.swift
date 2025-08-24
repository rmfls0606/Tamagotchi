//
//  BaseCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureHierarchy(){ }
    
    func configureLayout(){ }
    
    func configureView(){ }
}
