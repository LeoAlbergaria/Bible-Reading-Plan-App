//
//  SettingsViewModel.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import Foundation

protocol SettingsViewModelProtocol: AnyObject {
    func saveSettings(_ settings: ReadingPlanSettings)
    
    var isFirstLaunch: Bool { get }
}

// MARK: - Properties

class SettingsViewModel: SettingsViewModelProtocol {
    let isFirstLaunch: Bool
    
    init(isFirstLaunch: Bool = false) {
        self.isFirstLaunch = isFirstLaunch
    }
}

// MARK: - Public Functions

extension SettingsViewModel {
    func saveSettings(_ settings: ReadingPlanSettings) {
        UserDefaults.setSettings(settings)
    }
}
