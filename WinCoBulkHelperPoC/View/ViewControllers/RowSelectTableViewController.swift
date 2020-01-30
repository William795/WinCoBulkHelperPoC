//
//  RowSelectTableViewController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class RowSelectTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowController.shared.rowArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath)
        
        cell.textLabel?.text = RowController.shared.rowArray[indexPath.row].rowNumber
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScanSegue", let indexPath = tableView.indexPathForSelectedRow {
            let rowNumber = RowController.shared.rowArray[indexPath.row].rowNumber
            let destinationVC = segue.destination as? ScannerViewController
            destinationVC?.rowNumber = rowNumber
        }
    }
}
