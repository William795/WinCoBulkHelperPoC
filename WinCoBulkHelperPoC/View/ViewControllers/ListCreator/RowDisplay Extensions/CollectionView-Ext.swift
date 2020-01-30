//
//  RDVC-Ext-CollectionViewDeleage.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit

extension RowDisplayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == gravityBinCollectionView {
            return rowData.gravityBins.count
        } else {
            return rowData.barrels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == gravityBinCollectionView {
            let gravityBinCell = collectionView.dequeueReusableCell(withReuseIdentifier: "gravityBinCell", for: indexPath) as? GravityBinCollectionViewCell
            let item = rowData.gravityBins[indexPath.row]
            gravityBinCell?.item = item
            
            return gravityBinCell ?? UICollectionViewCell()
        } else {
            let barrelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "barrelCell", for: indexPath) as? BarrelCollectionViewCell
            let item = rowData.barrels[indexPath.row]
            barrelCell?.item = item
            
            return barrelCell ?? UICollectionViewCell()
        }
    }
}
