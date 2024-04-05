//
//  SettingsView.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

class SettingsView: UIView {
    
    // MARK: - Components
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupComponents() {
        backgroundColor = .background
        addSubview(datePicker)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            datePicker.widthAnchor.constraint(equalTo: widthAnchor),
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
