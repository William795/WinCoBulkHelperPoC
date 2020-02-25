//
//  StartingViewController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //mock data if rows are empty
        if RowController.shared.rowArray.isEmpty {
            RowController.shared.addRow(row: row1)
            RowController.shared.addRow(row: row2)
            RowController.shared.addRow(row: row3)
            RowController.shared.addRow(row: row4)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
