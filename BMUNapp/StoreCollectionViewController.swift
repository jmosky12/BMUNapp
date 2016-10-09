//
//  StoreCollectionViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/9/16.
//  Copyright © 2016 Jake Moskowitz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "storeCell"

class StoreCollectionViewController: UICollectionViewController {
    
    init() {
        super.init(nibName: "StoreCollectionViewController", bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let nib: UINib = UINib(nibName: "StoreCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 200, height: 200)
        flowLayout.scrollDirection = .horizontal
        self.collectionView?.collectionViewLayout = flowLayout
    
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let label = cell.viewWithTag(1) as? UILabel
        label!.text = "Store"
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
