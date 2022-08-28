//
//  SettingsViewController.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties

    private var settingItems: [SettingItem]?

    // MARK: - Outlets

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        settingItems = SettingItem.settingItems
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalTo(view)
        }
    }
}

// MARK: - Extentsions

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SettingsTableViewCell
        cell?.settingItem = settingItems?[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
