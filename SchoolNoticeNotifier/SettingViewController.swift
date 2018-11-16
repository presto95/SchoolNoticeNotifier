//
//  SettingViewController.swift
//  SchoolNoticeNotifier
//
//  Created by Presto on 15/11/2018.
//  Copyright © 2018 presto. All rights reserved.
//

import UIKit
import Carte

class SettingViewController: UIViewController {

    let cellTitles = [["학교 변경", "키워드 설정"], ["오픈소스 라이센스"]]
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "설정"
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellTitles[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        switch indexPath.section {
        case 0 where row == 0:
            let next = ChangeSchoolViewController()
            navigationController?.pushViewController(next, animated: true)
        case 0 where row == 1:
            let next = KeywordSettingViewController()
            navigationController?.pushViewController(next, animated: true)
        case 1 where row == 0:
            let controller: CarteViewController = {
                let controller = CarteViewController(style: .plain)
                controller.items.sort { $0.name < $1.name }
                return controller
            }()
            navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}
