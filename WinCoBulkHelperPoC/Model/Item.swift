//
//  Item.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/17/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation

class Item: Codable {
    
    let displayName: String
    let transportName: String
    let barcode: String
    
    init(displayName: String, transportName: String, barcode: String) {
        self.displayName = displayName
        self.transportName = transportName
        self.barcode = barcode
    }
}

// mock item data

let apple1 = Item(displayName: "Apple 1", transportName: "1 apple", barcode: "1")
let apple2 = Item(displayName: "Apple 2", transportName: "2 apple", barcode: "2")
let apple3 = Item(displayName: "Apple 3", transportName: "3 apple", barcode: "3")
let apple4 = Item(displayName: "Apple 4", transportName: "4 apple", barcode: "4")
let apple5 = Item(displayName: "Apple 5", transportName: "5 apple", barcode: "5")
let apple6 = Item(displayName: "Apple 6", transportName: "6 apple", barcode: "6")
let apple7 = Item(displayName: "Apple 7", transportName: "7 apple", barcode: "7")
let apple8 = Item(displayName: "Apple 8", transportName: "8 apple", barcode: "8")
let apple9 = Item(displayName: "Apple 9", transportName: "9 apple", barcode: "9")
let apple10 = Item(displayName: "Apple 10", transportName: "10 apple", barcode: "10")
let apple11 = Item(displayName: "Apple 11", transportName: "11 apple", barcode: "11")
let apple12 = Item(displayName: "Apple 12", transportName: "12 apple", barcode: "12")
let apple13 = Item(displayName: "Apple 13", transportName: "13 apple", barcode: "13")
let apple14 = Item(displayName: "Apple 14", transportName: "14 apple", barcode: "14")
let apple15 = Item(displayName: "Apple 15", transportName: "15 apple", barcode: "15")
let apple16 = Item(displayName: "Apple 16", transportName: "16 apple", barcode: "16")
let apple17 = Item(displayName: "Apple 17", transportName: "17 apple", barcode: "17")
let apple18 = Item(displayName: "Apple 18", transportName: "18 apple", barcode: "18")
let apple19 = Item(displayName: "Apple 19", transportName: "19 apple", barcode: "19")
let apple20 = Item(displayName: "Apple 20", transportName: "20 apple", barcode: "20")
