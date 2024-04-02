//
//  HomeTableViewCell.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 15/02/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "circle")
        image.tintColor = .main
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(UIView())
        view.addArrangedSubview(iconImageView)
        view.axis = .horizontal
        view.spacing = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
        setupConstraints()
    }
    
    // MARK: - Setup
    
    private func setupComponents() {
        addSubview(mainStackView)
        backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(_ dailyPlan: DailyReading){
        let section1 = dailyPlan.section1
        let section2 = dailyPlan.section2
        
        titleLabel.text = "\(section1) | \(section2)"
        
        iconImageView.image = dailyPlan.isReaded ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
    }
}


