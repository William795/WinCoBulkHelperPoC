//
//  LCVC-Ext-RowPicker.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/17/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation
import UIKit

extension ListCreatorViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
}
