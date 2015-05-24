//
//  DataSource.swift
//  ParallaxCollectionView
//
//  Created by Patrick Hogan on 5/24/15.
//  Copyright (c) 2015 Dan Hogan. All rights reserved.
//

import UIKit

private let kCollectionViewCellIdentifier = "CollectionViewCell"

class DataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, CollectionViewCellDelegate {
    
    let collectionView: UICollectionView

    init(collectionView aCollectionView: UICollectionView) {
        collectionView = aCollectionView
        super.init()
        
    }
    
    func registerReusableViews(collectionView: UICollectionView) {
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellIdentifier)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionViewCellIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.delegate = self
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "db71878985fcc62387131f14f42fc523")
        } else if indexPath.row == 1 {
            cell.imageView.image = UIImage(named: "9ee570c890b4986d07884eaec25c2820")
        } else if indexPath.row == 2 {
            cell.imageView.image = UIImage(named: "6a6516de1035a4403c81b7092ebf6418")
        } else if indexPath.row == 3 {
            cell.imageView.image = UIImage(named: "7a71ecaac33617f0e2b9923909eb9d37")
        } else if indexPath.row == 4 {
            cell.imageView.image = UIImage(named: "ac60ef293b1778d71fa8673cac6a995a")

        } else if indexPath.row == 5 {
            cell.imageView.image = UIImage(named: "46c927e5f5b62498854a6eb472db36fa")
        } else if indexPath.row == 6 {
            cell.imageView.image = UIImage(named: "KateUptonfeatured")
        } else if indexPath.row == 7 {
            cell.imageView.image = UIImage(named: "d19f4593e7bc4b0b9c6e9312cbcb9fb4")
        } else if indexPath.row == 8 {
            cell.imageView.image = UIImage(named: "IMG_0267")

        }
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.size.width, 200.0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateCollectionViewParallax()
    }
    
    func updateCollectionViewParallax() {
        let visibleCells = collectionView.visibleCells() as! [UIView]
        for cell in visibleCells {
            if cell.isKindOfClass(CollectionViewCell.self) {
                let normalizedOffset = collectionView.superview!.convertPoint(
                    CGPointMake(0.0, cell.frame.size.height),
                    fromView:cell
                    ).y/(collectionView.superview!.frame.size.height + cell.frame.size.height)
                (cell as! CollectionViewCell).imageViewNormalizedYOffset = normalizedOffset
            }
        }
    }
    
    //MARK:- CollectionViewCellDelegate
    
    func collectionViewCell(collectionViewCellDidLayoutSubViews collectionViewCell: CollectionViewCell) {
        updateCollectionViewParallax()
    }

}
