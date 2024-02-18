//
//  ViewController.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 14/02/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
  
  let baseView: HomeView = HomeView()
  var viewModel: HomeViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  func setup(){
    view = baseView
    baseView.tableView.delegate = self
    baseView.tableView.dataSource = self
    
    title = "Plan"
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.plan.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    guard let dailyPlan = viewModel?.plan[row],
          let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    cell.configure(dailyPlan)
    return cell
  }
}
