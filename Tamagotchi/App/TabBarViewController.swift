//
//  TabBarViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configure()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeTabView), name: .tamagotchiTabViewChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func configure() {
        let pages: [TabBarPage] = TabBarPage.allCases
        let viewController: [UIViewController] = pages.map { page in
            let viewController = page.viewController
            viewController.tabBarItem = page.tabBarItem
            return viewController
        }
        
        setViewControllers(viewController, animated: false)
        tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = .systemGray2
        tabBar.backgroundColor = .systemGray6
    }
    
    @objc
    private func changeTabView(){
        guard let viewControllers = viewControllers else { return }
        
        if let nav = viewControllers.first as? UINavigationController{
            let newRootViewController = UserManager.shared.isOnboarded ? MainViewController() : TamagotchiSelectViewController()
            nav.setViewControllers([newRootViewController], animated: false)
            selectedIndex = 0
            return
        }
    }
}
