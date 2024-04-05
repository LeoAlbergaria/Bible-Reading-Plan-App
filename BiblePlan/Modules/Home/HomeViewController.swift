//
//  ViewController.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 14/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: HomeView = HomeView()
    var viewModel: HomeViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        viewModel?.loadData(completion: { success in
            guard success else { return }
            
            if let dailyPlan = self.viewModel?.getDailyPlan() {
                self.baseView.configure(dailyPlan: dailyPlan)
            }
            self.baseView.tableView.reloadData()
        })
    }
    
    func setup(){
        view = baseView
        title = "Bible Plan"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .plain, target: self, action: #selector(self.settingsAction))
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
    
    @objc func settingsAction(){
        let viewController = SettingsViewControler()
        viewController.viewModel = SettingsViewModel()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - SettingsViewControler Delegate

extension HomeViewController: SettingsViewControlerDelegate {
    func reloadData() {
        viewModel?.reloadData(completion: { _ in
            if let dailyPlan = self.viewModel?.getDailyPlan() {
                self.baseView.configure(dailyPlan: dailyPlan)
            }
            self.baseView.tableView.reloadData()
        })
    }
}


// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        viewModel?.readingPlan[row].isReaded.toggle()
        let indexPath = IndexPath(item: row, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        viewModel?.saveData()
        if let dailyPlan = viewModel?.getDailyPlan() {
            self.baseView.configure(dailyPlan: dailyPlan)
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = viewModel?.readingPlan.count ?? 0
        baseView.tableView.heightAnchor.constraint(equalToConstant: CGFloat(rows * 60)).isActive = true
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let dailyPlan = viewModel?.readingPlan[row],
              let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(dailyPlan)
        return cell
    }
}
