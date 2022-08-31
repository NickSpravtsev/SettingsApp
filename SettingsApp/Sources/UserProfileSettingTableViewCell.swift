//
//  UserProfileSettingTableViewCell.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 31.08.2022.
//

import UIKit

class UserProfileSettingTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let identifier = "user profile cell"

    var settingItem: SettingItem? {
        didSet {
            iconImageView.image = settingItem?.icon
            nameLabel.text = settingItem?.name
            detailLabel.text = settingItem?.detail
        }
    }

    // MARK: - Outlets

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)

        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)

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

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
    }

    private func setupLayout() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.width.height.equalTo(60)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(15)
            make.bottom.equalTo(contentView.snp.centerY)

        }

        detailLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(15)
            make.top.equalTo(contentView.snp.centerY).offset(4)
        }
    }

}
