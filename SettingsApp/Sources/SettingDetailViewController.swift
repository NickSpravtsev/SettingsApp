//
//  SettingDetailViewController.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 30.08.2022.
//

import UIKit
import SnapKit

class SettingDetailViewController: UIViewController {

    // MARK: - Properties
    var settingItem: SettingItem?

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
        label.font = UIFont.boldSystemFont(ofSize: 28)

        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray

        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        fillView()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(iconView)
        iconView.addSubview(iconImageView)
        view.addSubview(nameLabel)
        view.addSubview(detailLabel)
    }

    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.width.equalTo(100)
        }

        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(70)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(iconView.snp.bottom).offset(30)
        }

        detailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
    }

    // MARK: - Funcions

    private func fillView() {
        iconImageView.image = settingItem?.icon
        iconView.backgroundColor = settingItem?.backgroundColor
        nameLabel.text = settingItem?.name
        detailLabel.text = settingItem?.detail
    }
}
