//
//  ViewController.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 27/3/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var tableView = UITableView()
    private var timeData: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        apiManager()
    }

    private func initUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        title = "News"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.idCell)
        
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(80)
        }
    }
    
    func apiManager(){
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let `self` else {return}
                    self.timeData = data.articles
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.idCell) as! NewsViewCell
        
        let value = timeData[indexPath.row]
        
        cell.configure(with: value)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetails = DetailsNews()
        let value = timeData[indexPath.row]
        newsDetails.configure(with: value)
        self.navigationController?.pushViewController(newsDetails, animated: true)
    }
    

}

