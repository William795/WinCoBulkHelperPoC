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
    
    func updateCell() {
        guard let item = item else {return}
        
        barrelDisplayLabel.text = item.displayName
        barrelFillSwitch.isOn = false
    }
}
