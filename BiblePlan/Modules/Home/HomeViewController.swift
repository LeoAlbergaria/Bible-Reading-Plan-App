//
//  ViewController.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 14/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let baseView: HomeView = HomeView()
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.loadData()
        setup()
    }
    
    func setup(){
        view = baseView
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        
        
        if let dailyPlan = viewModel?.getDailyPlan() {
            baseView.configure(dailyPlan: dailyPlan)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        viewModel?.readingPlan[row].isReaded.toggle()
        let indexPath = IndexPath(item: row, section: 0)
        tableView.reloadRows(at: [indexPath], with: .top)
        viewModel?.saveData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.readingPlan.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let dailyPlan = viewModel?.readingPlan[row],
              let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(dailyPlan)
        return cell
        return UITableViewCell()
    }
}
