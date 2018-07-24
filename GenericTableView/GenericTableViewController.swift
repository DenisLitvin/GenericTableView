//
//  ViewController.swift
//  GenericTableView
//
//  Created by Denis Litvin on 24.07.2018.
//  Copyright © 2018 Denis Litvin. All rights reserved.
//

import UIKit

class GenericTableViewController<Cell: GenericTableCell>: UITableViewController {
    
    let cellId = "id"
    
    var items = [Cell.Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        
        tableView.tableFooterView = UIView()
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = rc
    }
    
    @objc func handleRefresh() {
        tableView.refreshControl?.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! Cell
        cell.item = items[indexPath.row]
        return cell
    }
    
}
protocol GenericTableCell where Self: UITableViewCell {
    associatedtype Item
    var item: Item {get set}
}

class GenericCell<U>: UITableViewCell, GenericTableCell {
    var item: U!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
