//
//  TabBarPage.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit

enum TabBarPage: String, CaseIterable{
    case tamagotchi = "TAMAGOTCHI"
    case lotto = "LOTTO"
    case boxOffice = "BOX OFFICE"
    
    var viewController: UIViewController{
        switch self {
        case .tamagotchi:
            if UserManager.shared.isOnboarded{
                return UINavigationController(rootViewController: MainViewController())
            }else{
                return UINavigationController(rootViewController: TamagotchiSelectViewController())
            }
        case .lotto:
            return UINavigationController(rootViewController: LottoViewController())
        case .boxOffice:
            return UINavigationController(rootViewController: BoxOfficeViewController())
        }
    }
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .tamagotchi:
            return UITabBarItem(title: self.rawValue, image: UIImage(systemName: "pawprint.circle"), tag: 0)
        case .lotto:
            return UITabBarItem(title: self.rawValue, image: UIImage(systemName: "1.circle"), tag: 1)
        case .boxOffice:
            return UITabBarItem(title: self.rawValue, image: UIImage(systemName: "popcorn.circle"), tag: 2)
        }
    }
}
