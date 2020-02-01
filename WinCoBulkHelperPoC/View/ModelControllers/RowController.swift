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
    
    private init() {
        rowArray = loadFromPersistantStore()
    }
    
    var emptyRow = Row(gravityBins: [], barrels: [], rowNumber: "Empty Row")
    
    var rowArray: [Row] = []
    
    var currentList: [Item] = []
    
    func addRow(row: Row) {
        rowArray.append(row)
        saveToPersistntStore()
    }
    
    func addRowGravBins(row: Row, item: Item) {
        if row.gravityBins.last?.barcode == item.barcode {
            print("same item")
            return
        }
        row.gravityBins.append(item)
        print("new item added")
        saveToPersistntStore()
    }
    
    func addRowBarrels(row: Row, item: Item) {
        if row.barrels.last?.barcode == item.barcode {
            print("same item")
            return
        }
        row.barrels.append(item)
        saveToPersistntStore()
    }
    
    
    func clearRow(row: Row) {
        row.gravityBins = []
        row.barrels = []
    }
    
    func clearCurrentList() {
        currentList = []
    }
    
    func deleteRow(rowToDelete: Int) {
        rowArray.remove(at: rowToDelete)
        saveToPersistntStore()
    }
    
    func fileURL() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "Rows.json"
        let fullURL = documentDirectory.appendingPathComponent(fileName)
        
        return fullURL
    }
    
    func saveToPersistntStore() {
        let jsonEncoder = JSONEncoder()
        
        do{
            let data = try jsonEncoder.encode(rowArray)
            let url = fileURL()
            try data.write(to: url)
        } catch let EntrieError {
            print(EntrieError)
        }
    }
    
    func loadFromPersistantStore() -> [Row] {
        let jsonDecoder = JSONDecoder()
        do {
            let url = fileURL()
            let data = try Data(contentsOf: url)
            let row = try jsonDecoder.decode([Row].self, from: data)
            return row
        }catch let decodingError {
            print(decodingError)
        }
        return []
    }
}
