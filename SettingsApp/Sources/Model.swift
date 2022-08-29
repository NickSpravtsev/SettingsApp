//
//  Model.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

private let airplaneModeImage: UIImage = UIImage(systemName: "airplane") ?? .remove
private let wifiImage: UIImage = UIImage(systemName: "wifi") ?? .remove
private let bluetoothImage : UIImage = UIImage(named: "bluetoothIcon")?.withTintColor(.white) ?? .remove
private let generalIcon: UIImage = UIImage(systemName: "gear") ?? .remove

enum SettingType {
    case simple
    case withSwitch
    case withDetail
    case withNotification
}

struct SettingItem {
    var icon: UIImage
    var backgroundColor: UIColor
    var name: String
    var note = ""
    var type: SettingType
}

extension SettingItem {
    static var settingItems: [[SettingItem]] = [
        [SettingItem(icon: airplaneModeImage, backgroundColor: .systemOrange, name: "Авиарежим", type: .withSwitch),
        SettingItem(icon: wifiImage, backgroundColor: .systemBlue, name: "Wi-Fi", type: .simple)],
        [SettingItem(icon: bluetoothImage, backgroundColor: .systemBlue, name: "Bluetooth", note: "Вкл.", type: .withDetail)],
        [SettingItem(icon: generalIcon, backgroundColor: .systemGray, name: "Основные", type: .withNotification)]
    ]
}
