//
//  Model.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

let airplaneModeImage: UIImage = UIImage(systemName: "airplane") ?? .remove
let wifiImage: UIImage = UIImage(systemName: "wifi.square.fill") ?? .remove

struct SettingItem: Hashable {
    var icon: UIImage
    var tintColor: UIColor
    var name: String
}

extension SettingItem {
    static var settingItems: [SettingItem] = [
        SettingItem(icon: airplaneModeImage, tintColor: .systemOrange, name: "Авиарежим"),
        SettingItem(icon: wifiImage, tintColor: .systemBlue, name: "Wi-Fi")
    ]
}
