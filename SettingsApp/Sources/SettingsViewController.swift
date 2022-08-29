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
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "simple cell")
        tableView.register(SettingWithSwitchTableViewCell.self, forCellReuseIdentifier: "cell with switch")
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
        let item = settingItems?[indexPath.row]

        switch item?.type {
        case .simple:
            let simpleCell = settingsTableView.dequeueReusableCell(withIdentifier: "simple cell", for: indexPath) as? SettingTableViewCell
            simpleCell?.settingItem = settingItems?[indexPath.row]
            simpleCell?.accessoryType = .disclosureIndicator
            return simpleCell ?? UITableViewCell()
        case .withSwitch:
            let cellWithSwitch = settingsTableView.dequeueReusableCell(withIdentifier: "cell with switch", for: indexPath) as? SettingWithSwitchTableViewCell
            cellWithSwitch?.settingItem = settingItems?[indexPath.row]
            return cellWithSwitch ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
