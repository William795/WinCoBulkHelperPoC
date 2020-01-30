//
//  GravityBinCollectionViewCell.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class GravityBinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gravDisplayNameLabel: UILabel!
    @IBOutlet weak var gravFillSwitch: UISwitch!
    
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
        
        gravDisplayNameLabel.text = cellItem.displayName
        
        for item in RowController.shared.currentList {
            if cellItem.displayName == item.displayName {
                gravFillSwitch.isOn = true
                return
            }
            gravFillSwitch.isOn = false
        }
    }
}
