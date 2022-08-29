//
//  Model.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

let airplaneModeImage: UIImage = UIImage(systemName: "airplane") ?? .remove
let wifiImage: UIImage = UIImage(systemName: "wifi.square.fill") ?? .remove
let bluetoothImage : UIImage = UIImage(systemName: "play.square.fill") ?? .remove
let generalIcon: UIImage = UIImage(systemName: "gear.circle.fill") ?? .remove

enum SettingType {
    case simple
    case withSwitch
    case withNote
    case withNotification
}

struct SettingItem {
    var icon: UIImage
    var tintColor: UIColor
    var name: String
    var note = ""
    var type: SettingType
}

extension SettingItem {
    static var settingItems: [SettingItem] = [
        SettingItem(icon: airplaneModeImage, tintColor: .systemOrange, name: "Авиарежим", type: .withSwitch),
        SettingItem(icon: wifiImage, tintColor: .systemBlue, name: "Wi-Fi", type: .simple),
        SettingItem(icon: bluetoothImage, tintColor: .systemBlue, name: "Bluetooth", note: "Вкл.", type: .withNote),
        SettingItem(icon: generalIcon, tintColor: .systemGray, name: "Основные", type: .withNotification)
    ]
}
