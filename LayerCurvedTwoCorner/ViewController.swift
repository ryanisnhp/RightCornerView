//
//  ViewController.swift
//  LayerCurvedTwoCorner
//
//  Created by HP on 6/23/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var items = [Item(backgroundColor: UIColor(rgb: 0xb8dff0), labelColor: UIColor(rgb: 0x3e4e88), textColor: UIColor.white, content: "$10.0"),
                 Item(backgroundColor: UIColor(rgb: 0xfbe8d3), labelColor: UIColor(rgb: 0xf85f73), textColor: UIColor.white, content: "United States!"),
                 Item(backgroundColor: UIColor(rgb: 0xf6f6f6), labelColor: UIColor(rgb: 0xea5455), textColor: UIColor.white, content: "On Sale!"),
                 Item(backgroundColor: UIColor(rgb: 0xceecf0), labelColor: UIColor(rgb: 0xff7777), textColor: UIColor.white, content: "90% off")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(tableView: tableView, cellReuseIDs: ["CornerCell"], delegate: self, datasource: self)
    }
    
    func setupTableView(tableView: UITableView, cellReuseIDs: [String], delegate: UITableViewDelegate,
                        datasource: UITableViewDataSource){
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = delegate
        tableView.dataSource = datasource
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
        cellReuseIDs.forEach({
            let nib = UINib(nibName: $0, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: $0)
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CornerCell", for: indexPath) as! CornerCell
        cell.selectionStyle = .none
        cell.item = items[indexPath.row]
        return cell
    }
}
