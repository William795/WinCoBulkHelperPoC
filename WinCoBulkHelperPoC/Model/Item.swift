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
let apple21 = Item(displayName: "Apple 21", transportName: "21 apple", barcode: "21")
let apple22 = Item(displayName: "Apple 22", transportName: "22 apple", barcode: "22")
let apple23 = Item(displayName: "Apple 23", transportName: "23 apple", barcode: "23")
let apple24 = Item(displayName: "Apple 24", transportName: "24 apple", barcode: "24")
let apple25 = Item(displayName: "Apple 25", transportName: "25 apple", barcode: "25")
let apple26 = Item(displayName: "Apple 26", transportName: "26 apple", barcode: "26")
let apple27 = Item(displayName: "Apple 27", transportName: "27 apple", barcode: "27")
let apple28 = Item(displayName: "Apple 28", transportName: "28 apple", barcode: "28")
let apple29 = Item(displayName: "Apple 29", transportName: "29 apple", barcode: "29")
let apple30 = Item(displayName: "Apple 30", transportName: "30 apple", barcode: "30")
let apple31 = Item(displayName: "Apple 31", transportName: "31 apple", barcode: "31")
let apple32 = Item(displayName: "Apple 32", transportName: "32 apple", barcode: "32")
let apple33 = Item(displayName: "Apple 33", transportName: "33 apple", barcode: "33")
let apple34 = Item(displayName: "Apple 34", transportName: "34 apple", barcode: "34")
let apple35 = Item(displayName: "Apple 35", transportName: "35 apple", barcode: "35")
let apple36 = Item(displayName: "Apple 36", transportName: "36 apple", barcode: "36")
let apple37 = Item(displayName: "Apple 37", transportName: "37 apple", barcode: "37")
let apple38 = Item(displayName: "Apple 38", transportName: "38 apple", barcode: "38")
let apple39 = Item(displayName: "Apple 39", transportName: "39 apple", barcode: "39")
let apple40 = Item(displayName: "Apple 40", transportName: "40 apple", barcode: "40")

