//
//  SettingsViewControler.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

protocol SettingsViewControlerDelegate: AnyObject {
    func reloadData()
}

class SettingsViewControler: UIViewController {
    
    // MARK: - Properties
    
    var delegate: SettingsViewControlerDelegate?
    let baseView: SettingsView = SettingsView()
    var viewModel: SettingsViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        view = baseView
        
        title = viewModel?.isFirstLaunch ?? false ? "Welcome" : "Settings"
        
        baseView.delegate = self
    }
}

extension SettingsViewControler: SettingsViewDelegate {
    func saveSettings(_ settings: ReadingPlanSettings) {
        viewModel?.saveSettings(settings)
        
        guard viewModel?.isFirstLaunch ?? true else {
            delegate?.reloadData()
            navigationController?.popViewController(animated: true)
            return
        }
        
        
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel()
        
        let navigationController = UINavigationController(rootViewController: homeViewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.tintColor = homeViewController.traitCollection.userInterfaceStyle == .light ? .black : .white
        
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = navigationController
    }
}
