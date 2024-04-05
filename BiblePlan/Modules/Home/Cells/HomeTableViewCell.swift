//
//  HomeTableViewCell.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 15/02/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Components
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var text1Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var text2Label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(text1Label)
        view.addArrangedSubview(text2Label)
        view.axis = .vertical
        view.spacing = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        view.addArrangedSubview(dateLabel)
        view.addArrangedSubview(dividerView)
        view.addArrangedSubview(textStackView)
        view.addArrangedSubview(UIView())
        view.addArrangedSubview(iconImageView)
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
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
            
            dateLabel.widthAnchor.constraint(equalToConstant: 54),
            dividerView.heightAnchor.constraint(equalToConstant: frame.size.height * 0.8),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func configure(_ dailyPlan: DailyReading){
        let section1 = dailyPlan.section1
        let section2 = dailyPlan.section2
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        dateLabel.text = formatter.string(from: dailyPlan.date)
        
        text1Label.text = "\(section1)"
        text2Label.text = "\(section2)"
        
        iconImageView.image = dailyPlan.isReaded ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
    }
}


