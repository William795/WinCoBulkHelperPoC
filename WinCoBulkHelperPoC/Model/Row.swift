//
//  Row.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/20/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation

class Row: Codable {
    
    var gravityBins: [Item]
    var barrels: [Item]
    var rowNumber: String
    
    init(gravityBins: [Item], barrels: [Item], rowNumber: String) {
        self.gravityBins = gravityBins
        self.barrels = barrels
        self.rowNumber = rowNumber
    }
}

let row1 = Row(gravityBins: [apple1, apple2, apple3], barrels: [apple4, apple5, apple6, apple7, apple8, apple9, apple10], rowNumber: "1")
let row2 = Row(gravityBins: [apple11, apple12, apple13], barrels: [apple14, apple15, apple16, apple17, apple18, apple19, apple20], rowNumber: "2")
let row3 = Row(gravityBins: [apple21, apple22, apple23, apple24], barrels: [apple25, apple26, apple27, apple28, apple29,apple30], rowNumber: "3")
let row4 = Row(gravityBins: [apple31, apple32, apple33, apple34], barrels: [apple35, apple36, apple37, apple38, apple39, apple40], rowNumber: "4")
