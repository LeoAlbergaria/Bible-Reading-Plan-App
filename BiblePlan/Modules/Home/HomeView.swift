//
//  HomeView.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 14/02/24.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Components
    
    lazy var nextReadDateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nextReadLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = . center
        label.font = .boldSystemFont(ofSize: 28.0)
        label.textColor = .black
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
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nextReadCardView)
        view.addArrangedSubview(tableView)
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.addSubview(mainStackView)
        view.showsVerticalScrollIndicator = false
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
    
    // MARK: - Setup
    
    private func setupComponents() {
        backgroundColor = .background
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 6),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    func configure(dailyPlan: DailyReading){
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        nextReadDateLabel.text = formatter.string(from: Date())
        
        let section1 = dailyPlan.section1
        let section2 = dailyPlan.section2
        
        nextReadLabel.text = "\(section1) | \(section2)"
    }
}
