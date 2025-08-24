//
//  BaseViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import UIKit

class BaseViewController: UIViewController {

    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
        configureBind()
    }
    
    func configureHierarchy(){ }
    
    func configureLayout(){ }
    
    func configureView(){ }
    
    func configureBind(){ }
}
