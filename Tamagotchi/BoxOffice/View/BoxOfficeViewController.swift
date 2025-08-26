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
    
    private let disposeBag = DisposeBag()
    
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
        view.separatorInset = .zero
        return view
    }()
    
private var boxOfficeList: BehaviorSubject<[DailyBoxOfficeList]> = BehaviorSubject(value: [])
    
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
    
    override func configureBind() {
        searchBar.rx.searchButtonClicked
            .withLatestFrom(searchBar.rx.text.orEmpty)
            .distinctUntilChanged()
            .flatMap({ value in
                CustomObservable.getBoxOffice(targetDt: value)
            })
            .subscribe(with: self) { owner, result in
                owner.boxOfficeList.onNext(result.boxOfficeResult.dailyBoxOfficeList)
            } onError: { owner, error in
                print("onError", error)
            }
            .disposed(by: disposeBag)
        
        boxOfficeList
            .bind(to: tableView.rx.items){ tableView, row, element in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                
                cell.textLabel?.text = element.movieNm
                return cell
            }
            .disposed(by: disposeBag)
    }
}
