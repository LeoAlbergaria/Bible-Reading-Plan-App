//
//  HomeTableViewCell.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 15/02/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
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
  
  func configure(_ dailyPlan: DailyPlan){
    var text = ""
    let book = dailyPlan.plan1.book.rawValue
    let firstChapter = String(dailyPlan.plan1.firstChapter.chapter)
    text = book + " " + firstChapter
    
    if let endingChapter = dailyPlan.plan1.endingChapter?.chapter {
     text += " - " + String(endingChapter)
    }
    
    titleLabel.text = text
  }
  
  private func setupComponents() {
    backgroundColor = .background
    addSubview(titleLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }
}


