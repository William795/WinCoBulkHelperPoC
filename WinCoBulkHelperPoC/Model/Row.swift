//
//  Row.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/20/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation

class Row {
    
    var gravityBins: [Item]
    var backBarrels: [Item]
    var frontBarrels: [Item]
    
    init(gravityBins: [Item], backBarrels: [Item], frontBarrels: [Item]) {
        self.gravityBins = gravityBins
        self.backBarrels = backBarrels
        self.frontBarrels = frontBarrels
    }
}

let row1 = Row(gravityBins: [apple1, apple2, apple3], backBarrels: [apple4, apple5, apple6], frontBarrels: [apple7, apple8, apple9, apple10])
