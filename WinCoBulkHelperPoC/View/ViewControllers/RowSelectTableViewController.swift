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
    
    @IBAction func newRowButton(_ sender: Any) {
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RowController.shared.deleteRow(rowToDelete: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScanSegue", let indexPath = tableView.indexPathForSelectedRow {
            let row = RowController.shared.rowArray[indexPath.row]
            let destinationVC = segue.destination as? ScannerViewController
            destinationVC?.row = row
        }
        if segue.identifier == "toScanFromNewRowSegue" {
            let row = Row(gravityBins: [], barrels: [], rowNumber: "newRow")
            let destinationVC = segue.destination as? ScannerViewController
            destinationVC?.row = row
        }
    }
}
