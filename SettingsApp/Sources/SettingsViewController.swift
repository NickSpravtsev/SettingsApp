//
//  SettingsViewController.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var settingItems: [[SettingItem]]?
    
    // MARK: - Outlets
    
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(SettingWithSwitchTableViewCell.self, forCellReuseIdentifier: SettingWithSwitchTableViewCell.identifier)
        tableView.register(SettingWithDetailTableViewCell.self, forCellReuseIdentifier: SettingWithDetailTableViewCell.identifier)
        tableView.register(SettingWithNotificationTableViewCell.self, forCellReuseIdentifier: SettingWithNotificationTableViewCell.identifier)
        tableView.register(UserProfileSettingTableViewCell.self, forCellReuseIdentifier: UserProfileSettingTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = settingItems?[indexPath.section][indexPath.row]
        
        switch item?.type {
        case .simple:
            let cell = settingsTableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .withSwitch:
            let cell = settingsTableView.dequeueReusableCell(withIdentifier: SettingWithSwitchTableViewCell.identifier, for: indexPath) as? SettingWithSwitchTableViewCell
            cell?.settingItem = item
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        case .withDetail:
            let cell = settingsTableView.dequeueReusableCell(withIdentifier: SettingWithDetailTableViewCell.identifier, for: indexPath) as? SettingWithDetailTableViewCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .withNotification:
            let cell = settingsTableView.dequeueReusableCell(withIdentifier: SettingWithNotificationTableViewCell.identifier, for: indexPath) as? SettingWithNotificationTableViewCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .userProfile:
            let cell = settingsTableView.dequeueReusableCell(withIdentifier: UserProfileSettingTableViewCell.identifier, for: indexPath) as? UserProfileSettingTableViewCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = settingItems?[indexPath.section][indexPath.row]
        switch item?.type {
        case .userProfile:
            return 92
        default:
            return 46
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.selectionStyle == UITableViewCell.SelectionStyle.none {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = SettingDetailViewController()
        viewController.settingItem = settingItems?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        print("Нажата ячейка \"\(settingItems?[indexPath.section][indexPath.row].name ?? "")\"")
    }
}
