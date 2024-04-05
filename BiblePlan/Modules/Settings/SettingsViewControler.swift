//
//  SettingsViewControler.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

class SettingsViewControler: UIViewController {
    
    // MARK: - Properties
    
    let baseView: SettingsView = SettingsView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        view = baseView
        title = "Settings"
    }
}

