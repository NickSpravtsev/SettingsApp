//
//  Model.swift
//  SettingsApp
//
//  Created by Nick Spravtsev on 28.08.2022.
//

import UIKit

private let airplaneModeImage: UIImage = UIImage(systemName: "airplane") ?? .remove
private let wifiImage: UIImage = UIImage(systemName: "wifi") ?? .remove
private let bluetoothImage: UIImage = UIImage(named: "bluetoothIcon")?.withTintColor(.white) ?? .remove
private let cellularImage: UIImage = UIImage(systemName: "antenna.radiowaves.left.and.right") ?? .remove
private let modemModeImage: UIImage = UIImage(systemName: "personalhotspot") ?? .remove
private let vpnImage: UIImage = UIImage(named: "vpnIcon")?.withTintColor(.white) ?? .remove

private let notificationBell: UIImage = UIImage(systemName: "bell.badge.fill") ?? .remove
private let soundImage: UIImage = UIImage(systemName: "speaker.wave.3.fill") ?? .remove
private let doNotDisturb: UIImage = UIImage(systemName: "moon.fill") ?? .remove
private let hourGlassImage: UIImage = UIImage(systemName: "hourglass") ?? .remove

private let generalIcon: UIImage = UIImage(systemName: "gear") ?? .remove
private let controlCenterIcon: UIImage = UIImage(systemName: "switch.2") ?? .remove
private let screenIcon: UIImage = UIImage(systemName: "textformat.size") ?? .remove
private let homescreenIcon: UIImage = UIImage(named: "homescreenIcon")?.withTintColor(.white) ?? .remove
private let universalcontrolIcon: UIImage = UIImage(named: "universalcontrolIcon")?.withTintColor(.white) ?? .remove
private let wallpaperIcon: UIImage = UIImage(named: "wallpaperIcon")?.withTintColor(.white) ?? .remove
private let siriIcon: UIImage = UIImage(named: "siriIcon") ?? .remove
private let faceidIcon: UIImage = UIImage(systemName: "faceid") ?? .remove
private let batteryIcon: UIImage = UIImage(systemName: "battery.100") ?? .remove
private let confidentialityIcon: UIImage = UIImage(systemName: "hand.raised.fill") ?? .remove

private let userProfileImage: UIImage = UIImage(named: "userPhoto") ?? .remove

enum SettingType {
    case simple
    case withSwitch
    case withDetail
    case withNotification
    case userProfile
}

struct SettingItem {
    var icon: UIImage
    var backgroundColor: UIColor = .clear
    var name: String
    var detail = ""
    var type: SettingType
}

extension SettingItem {
    static var settingItems: [[SettingItem]] = [
        [
            SettingItem(icon: userProfileImage, name: "Николай", detail: "Apple ID, iCloud, контент и покупки", type: .userProfile)
        ],
        [
            SettingItem(icon: airplaneModeImage, backgroundColor: .systemOrange, name: "Авиарежим", type: .withSwitch),
            SettingItem(icon: wifiImage, backgroundColor: .systemBlue, name: "Wi-Fi", detail: "Не подключено", type: .withDetail),
            SettingItem(icon: bluetoothImage, backgroundColor: .systemBlue, name: "Bluetooth", detail: "Вкл.", type: .withDetail),
            SettingItem(icon: cellularImage, backgroundColor: .systemGreen, name: "Сотовая связь", type: .simple),
            SettingItem(icon: modemModeImage, backgroundColor: .systemGreen, name: "Режим модема", type: .simple),
            SettingItem(icon: vpnImage, backgroundColor: .systemBlue, name: "VPN", type: .withSwitch)
        ],
        [
            SettingItem(icon: notificationBell, backgroundColor: .systemRed, name: "Уведомления", type: .simple),
            SettingItem(icon: soundImage, backgroundColor: .systemRed, name: "Звуки, тактильные сигналы", type: .simple),
            SettingItem(icon: doNotDisturb, backgroundColor: .systemIndigo, name: "Не беспокоить", type: .simple),
            SettingItem(icon: hourGlassImage, backgroundColor: .systemIndigo, name: "Экранное время", type: .simple)

        ],
        [
            SettingItem(icon: generalIcon, backgroundColor: .systemGray, name: "Основные", type: .withNotification),
            SettingItem(icon: controlCenterIcon, backgroundColor: .systemGray, name: "Пункт управления", type: .simple),
            SettingItem(icon: screenIcon, backgroundColor: .systemBlue, name: "Экран и яркость", type: .simple),
            SettingItem(icon: homescreenIcon, backgroundColor: .blue, name: "Экран \"Домой\"", type: .simple),
            SettingItem(icon: universalcontrolIcon, backgroundColor: .systemBlue, name: "Универсальный доступ", type: .simple),
            SettingItem(icon: wallpaperIcon, backgroundColor: .systemCyan, name: "Обои", type: .simple),
            SettingItem(icon: siriIcon, backgroundColor: .systemGray, name: "Siri и поиск", type: .simple),
            SettingItem(icon: faceidIcon, backgroundColor: .systemGreen, name: "Face ID и код-пароль", type: .simple),
            SettingItem(icon: batteryIcon, backgroundColor: .systemGreen, name: "Аккумулятор", type: .simple),
            SettingItem(icon: confidentialityIcon, backgroundColor: .systemBlue, name: "Конфиденциальность", type: .simple)
        ]
    ]
}
