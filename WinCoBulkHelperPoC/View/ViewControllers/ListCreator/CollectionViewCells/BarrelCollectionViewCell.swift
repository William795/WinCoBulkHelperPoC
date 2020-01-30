//
//  BarrelCollectionViewCell.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class BarrelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var barrelDisplayLabel: UILabel!
    @IBOutlet weak var barrelFillSwitch: UISwitch!
    
    var item: Item? {
        didSet {
            updateCell()
        }
    }
    
    @IBAction func switchHit(_ sender: Any) {
        guard let item = item else {return}
        RowController.shared.currentList.append(item)
    }
    
    func updateCell() {
        guard let cellItem = item else {return}
        
        barrelDisplayLabel.text = cellItem.displayName
        barrelFillSwitch.isOn = false
        
        for item in RowController.shared.currentList {
            if cellItem.displayName == item.displayName {
                barrelFillSwitch.isOn = true
            }
        }
    }
}
