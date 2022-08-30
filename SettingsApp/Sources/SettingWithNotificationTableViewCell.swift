//
//  SettingWithNotificationTableViewCell.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 29.08.2022.
//

import UIKit
import SnapKit

class SettingWithNotificationTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "cell with notification"

    var settingItem: SettingItem? {
        didSet {
            iconImageView.image = settingItem?.icon
            iconView.backgroundColor = settingItem?.backgroundColor
            nameLabel.text = settingItem?.name
        }
    }

    // MARK: - Outlets

    private lazy var iconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white

        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var notificationImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "1.circle.fill")
        imageView.image = image
        imageView.tintColor = .systemRed

        return imageView
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
        contentView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(notificationImageView)
    }

    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(32)
        }

        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.width.height.equalTo(28)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconView.snp.right).offset(10)
        }

        notificationImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
    }

}
