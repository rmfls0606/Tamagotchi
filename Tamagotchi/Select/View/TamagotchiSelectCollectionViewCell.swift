//
//  TamagotchiSelectCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit
import SnapKit

final class TamagotchiSelectCollectionViewCell: BaseCollectionViewCell {
    private(set) var tamagotchiImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "noImage")
        view.clipsToBounds = true
        return view
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
    
    override func configureHierarchy() {
        contentView.addSubview(tamagotchiImageView)
        
        tamagotchiNameLabelBox.addSubview(tamagotchiNameLabel)
        contentView.addSubview(tamagotchiNameLabelBox)
    }
    
    override func configureLayout() {
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(tamagotchiImageView.snp.width)
        }
        
        tamagotchiNameLabelBox.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        tamagotchiNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
}
