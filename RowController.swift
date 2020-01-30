//
//  MockData.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation

class RowController {
    
    static let shared = RowController()
    
    
    var rowOne = Row(gravityBins: [], barrels: [], rowNumber: "Row 1")
    var rowTwo = Row(gravityBins: [], barrels: [], rowNumber: "Row 2")
    
    var rowArray: [Row] = []
    
    var currentList: [Item] = []
    
    func addRowGravBins(row: Row, item: Item) {
        if row.gravityBins.last?.barcode == item.barcode {
            print("same item")
            return
        }
        row.gravityBins.append(item)
        print("new item added")
    }
    
    func addRowBarrels(row: Row, item: Item) {
        if row.barrels.last?.barcode == item.barcode {
            print("same item")
            return
        }
        row.barrels.append(item)
    }
    
    
    func clearRow(row: Row) {
        row.gravityBins = []
        row.barrels = []
    }
    
    func setUpRowArray() {
        rowOne = row1
        rowTwo = row2
        rowArray.append(rowOne)
        rowArray.append(rowTwo)
    }
    
    func clearCurrentList() {
        currentList = []
    }
}
