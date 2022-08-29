//
//  SwitchSettingsTableViewCell.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 29.08.2022.
//

import UIKit

class SettingWithSwitchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "cell with switch"
    
    var settingItem: SettingItem? {
        didSet {
            iconImageView.image = settingItem?.icon
            iconImageView.tintColor = settingItem?.tintColor
            nameLabel.text = settingItem?.name
        }
    }
    
    // MARK: - Outlets
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    private lazy var settingSwitch: UISwitch = {
        let settingSwitch = UISwitch()

        return settingSwitch
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(settingSwitch)
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }

        settingSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
    }
}
