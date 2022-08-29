//
//  Model.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

let airplaneModeImage: UIImage = UIImage(systemName: "airplane") ?? .remove
let wifiImage: UIImage = UIImage(systemName: "wifi.square.fill") ?? .remove

enum SettingType {
    case simple
    case withSwitch
}

struct SettingItem: Hashable {
    var icon: UIImage
    var tintColor: UIColor
    var name: String
    var type: SettingType
}

extension SettingItem {
    static var settingItems: [SettingItem] = [
        SettingItem(icon: airplaneModeImage, tintColor: .systemOrange, name: "Авиарежим", type: .withSwitch),
        SettingItem(icon: wifiImage, tintColor: .systemBlue, name: "Wi-Fi", type: .simple)
    ]
}
