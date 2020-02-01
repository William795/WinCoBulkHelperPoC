//
//  ItemController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/31/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import Foundation

class ItemController {
    
    static let shared = ItemController()
    
    var itemList: [Item] = []
    
    private init(){
        itemList = loadFromPersistantStore()
    }
    
    func addToItemList(item: Item) {
        
        var duplicateCounter = 0
        for currentItem in itemList {
            if item.barcode == currentItem.barcode {
                duplicateCounter += 1
            }
        }
        if duplicateCounter == 0 {
            itemList.append(item)
            saveToPersistntStore()
        }
    }
    
    func searchForItemWith(barcode: String) -> Item? {
        for item in itemList {
            if item.barcode == barcode {
                return item
            }
        }
        print("itemlist searched")
        return nil
    }
    
    func fileURL() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "Items.json"
        let fullURL = documentDirectory.appendingPathComponent(fileName)
        
        return fullURL
    }
    
    func saveToPersistntStore() {
        let jsonEncoder = JSONEncoder()
        
        do{
            let data = try jsonEncoder.encode(itemList)
            let url = fileURL()
            try data.write(to: url)
        } catch let EntrieError {
            print(EntrieError)
        }
    }
    
    func loadFromPersistantStore() -> [Item] {
        let jsonDecoder = JSONDecoder()
        do {
            let url = fileURL()
            let data = try Data(contentsOf: url)
            let itemArray = try jsonDecoder.decode([Item].self, from: data)
            return itemArray
        }catch let decodingError {
            print(decodingError)
        }
        return []
    }
}
