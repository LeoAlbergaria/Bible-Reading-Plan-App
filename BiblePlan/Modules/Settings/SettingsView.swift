//
//  SettingsView.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func saveSettings(_ settings:  ReadingPlanSettings)
}

class SettingsView: UIView {
    
    weak var delegate: SettingsViewDelegate?
    
    // MARK: - Components
    lazy var datePickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Select starting date:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var datePickerStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(datePickerLabel)
        view.addArrangedSubview(datePicker)
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weekSkipLabel: UILabel = {
        let label = UILabel()
        label.text = "Select days to skip:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    class WeekButton: UIButton {
        var isPressed: Bool = false
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupButton()
        }
        
        private func setupButton() {
            backgroundColor = .main.withAlphaComponent(0.3)
            layer.cornerRadius = 4
            addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        @objc func buttonAction(sender: UIButton) {
            sender.backgroundColor = isPressed ? .main.withAlphaComponent(0.3) : .main
            isPressed.toggle()
        }
    }
    
    lazy var sunday = WeekButton()
    lazy var monday = WeekButton()
    lazy var tuesday = WeekButton()
    lazy var wednesday = WeekButton()
    lazy var thursday = WeekButton()
    lazy var friday = WeekButton()
    lazy var saturday = WeekButton()
    
    lazy var weekdays = [sunday,
                         monday,
                         tuesday,
                         wednesday,
                         thursday,
                         friday,
                         saturday]
    
    lazy var weekStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(sunday)
        view.addArrangedSubview(monday)
        view.addArrangedSubview(tuesday)
        view.addArrangedSubview(wednesday)
        view.addArrangedSubview(thursday)
        view.addArrangedSubview(friday)
        view.addArrangedSubview(saturday)
        view.axis = .horizontal
        view.spacing = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weekSkipStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(weekSkipLabel)
        view.addArrangedSubview(weekStackView)
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .main
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(datePickerStackView)
        addSubview(weekSkipStackView)
        addSubview(saveButton)
        
        let fmt = DateFormatter()
        let weekdayList = fmt.shortWeekdaySymbols
        
        let settings = UserDefaults.getSettings()
        datePicker.date = settings?.initialDate ?? Date()
        
        let skipDays = settings?.skipDays ?? []
        
        for(index, weekdayButton) in weekdays.enumerated() {
            weekdayButton.setTitle(weekdayList?[index], for: .normal)
            if skipDays.contains(index+1) {
                weekdayButton.buttonAction(sender: weekdayButton)
            }
        }
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            datePickerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            datePickerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weekSkipStackView.topAnchor.constraint(equalTo: datePickerStackView.bottomAnchor, constant: 20),
            weekSkipStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            weekSkipStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            saveButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func saveAction(){
        var skipDays: [Int] = []
        for(index, weekdayButton) in weekdays.enumerated() {
            if weekdayButton.isPressed {
                skipDays.append(index + 1)
            }
        }
        
        guard skipDays.count != 7 else { return }
        
        let settings = ReadingPlanSettings(initialDate: datePicker.date, skipDays: skipDays)
        delegate?.saveSettings(settings)
    }
}
