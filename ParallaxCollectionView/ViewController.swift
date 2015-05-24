//
//  ViewController.swift
//  ParallaxCollectionView
//
//  Created by Patrick Hogan on 5/24/15.
//  Copyright (c) 2015 Dan Hogan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        return flowLayout
        }())

    private(set) lazy var dataSource: DataSource = {
        let dataSource = DataSource(collectionView: self.collectionView)
        return dataSource
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview({
            self.collectionView.showsHorizontalScrollIndicator = false
            self.collectionView.alwaysBounceVertical = true
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self.dataSource
            
            return self.collectionView
            }())
        
        self.dataSource.registerReusableViews(self.collectionView)
        
        self.collectionView.frame = view.frame
    }
}

