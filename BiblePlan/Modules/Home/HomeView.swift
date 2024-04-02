//
//  HomeView.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 14/02/24.
//

import UIKit

class HomeView: UIView {
    
    lazy var nextReadTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Leitura do Dia"
        label.font = .boldSystemFont(ofSize: 32.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nextReadDateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nextReadLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = . center
        label.font = .boldSystemFont(ofSize: 28.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nextReadCardView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nextReadDateLabel)
        view.addArrangedSubview(nextReadLabel)
        view.axis = .vertical
        view.backgroundColor = .main
        view.layer.cornerRadius = 10
        view.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 16, right: 20)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nextReadTitleLabel)
        view.addArrangedSubview(nextReadCardView)
        view.addArrangedSubview(tableView)
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents() {
        backgroundColor = .background
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    func configure(dailyPlan: DailyReading){
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        nextReadDateLabel.text = formatter.string(from: Date())
        
        let section1 = dailyPlan.section1
        let section2 = dailyPlan.section2
        
        nextReadLabel.text = section1.book + " " + section1.firstChapter + " | " + section2.book + " " + section2.firstChapter
    }
}
