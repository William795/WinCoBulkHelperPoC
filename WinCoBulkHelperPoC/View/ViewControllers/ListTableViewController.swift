//
//  ListTableViewController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/17/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    
    var itemList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func newListButton(_ sender: Any) {
        RowController.shared.clearCurrentList()
        self.navigationController?.popToRootViewController(animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //maybe make this 2 sections(seperating gravbins from barrels)
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        cell.textLabel?.text = itemList[indexPath.row].displayName
        cell.detailTextLabel?.text = itemList[indexPath.row].transportName

        return cell
    }
}
