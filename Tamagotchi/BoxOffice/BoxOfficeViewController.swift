//
//  BoxOfficeViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class BoxOfficeViewController: BaseViewController {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = .systemGray6
        searchBar.placeholder = "yyyyMMdd"
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "Box Office"
    }
}
