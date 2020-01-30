//
//  RowDisplayViewController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class RowDisplayViewController: UIViewController {

    @IBOutlet weak var gravityBinCollectionView: UICollectionView!
    @IBOutlet weak var barrelCollectionView: UICollectionView!
    @IBOutlet weak var rowPicker: UIPickerView!
        
    var rowData: Row = RowController.shared.rowArray[0] {
        didSet {
            gravityBinCollectionView.reloadData()
            barrelCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gravityBinCollectionView.delegate = self
        barrelCollectionView.delegate = self
        rowPicker.delegate = self
        
        gravityBinCollectionView.dataSource = self
        barrelCollectionView.dataSource = self
        rowPicker.dataSource = self
        
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toListTableView" {
            let itemList = RowController.shared.currentList
            let destinationVC = segue.destination as? ListTableViewController
            destinationVC?.itemList = itemList
        }
    }
    

}
