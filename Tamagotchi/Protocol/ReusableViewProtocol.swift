//
//  ReusableViewProtocol.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit

protocol ReusableViewProtocol{
    static var identifier: String { get }
}

extension UICollectionViewCell: ReusableViewProtocol{
    static var identifier: String{
        return String(describing: self)
    }
}
