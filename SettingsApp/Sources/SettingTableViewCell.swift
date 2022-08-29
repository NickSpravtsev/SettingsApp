//
//  SettingsTableViewCell.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
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
        addSubview(iconImageView)
        addSubview(nameLabel)
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(contentView).offset(10)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).offset(10)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
    }
}
