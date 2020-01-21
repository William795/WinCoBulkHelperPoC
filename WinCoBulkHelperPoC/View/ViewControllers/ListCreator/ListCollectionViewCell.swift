//
//  ListCollectionViewCell.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/17/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    var row: Row? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var gravBinOneSwitch: UISwitch!
    @IBOutlet weak var gravBinTwoSwitch: UISwitch!
    @IBOutlet weak var backBarrelSwitch: UISwitch!
    @IBOutlet weak var frontBarrelSwitch: UISwitch!
    @IBOutlet weak var gravBinOneLabel: UILabel!
    @IBOutlet weak var gravBinTwoLabel: UILabel!
    @IBOutlet weak var backBarrelLabel: UILabel!
    @IBOutlet weak var frontBarrelLabel: UILabel!
    
    func updateView() {
        gravBinOneSwitch.isOn = false
        gravBinTwoSwitch.isOn = false
        backBarrelSwitch.isOn = false
        frontBarrelSwitch.isOn = false
        gravBinOneLabel.text = row?.gravityBins[0].displayName
        gravBinTwoLabel.text = row?.gravityBins[1].displayName
        backBarrelLabel.text = row?.backBarrels[0].displayName
        frontBarrelLabel.text = row?.frontBarrels[0].displayName
    }
}
