//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/25/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SettingViewController: BaseViewController {
    
    //MARK: - Property
    private let viewModel = SettingViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - View
    private let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        return view
    }()
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        
        navigationItem.title = "설정"
    }
    
    override func configureBind() {
        let input = SettingViewModel.Input(
            cellItemSelected: tableView.rx.itemSelected
        )
        
        let output = viewModel.transform(input: input)
        
        output.settingCellData
            .bind(to: tableView.rx.items){ tableView, row, element in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") ?? UITableViewCell(style: .value1, reuseIdentifier: "SettingTableViewCell")
                
                cell.imageView?.image = UIImage(systemName: element.imageName)
                cell.imageView?.tintColor = .black

                cell.textLabel?.text = element.title
                cell.textLabel?.font = .systemFont(ofSize: 14)
                
                cell.detailTextLabel?.text = element.detail
                
                cell.accessoryType = .disclosureIndicator
                cell.separatorInset = .zero
                cell.selectionStyle = .none
                
              return cell
            }
            .disposed(by: disposeBag)
        
        output.selectedInexPath
            .bind(with: self) { owner, row in
                if row == 0{
                    let vc = SetNicknameViewController()
                    vc.didSavedNickname = { [weak owner] nickname in
                        owner?.viewModel.updateNickname(nickname: nickname)
                    }
                    owner.navigationController?.pushViewController(vc, animated: true)
                }else if row == 1{
                    let vc = TamagotchiSelectViewController()
                    vc.isEditMode = true
                    owner.navigationController?.pushViewController(vc, animated: true)
                }else{
                    owner.showAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?") {
                        UserManager.shared.resetUser()
                        
                        NotificationCenter.default.post(name: .tamagotchiTabViewChange, object: nil)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
}

