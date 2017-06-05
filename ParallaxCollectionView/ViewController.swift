//
//  ViewController.swift
//  ParallaxCollectionView
//
//  Created by Patrick Hogan on 5/24/15.
//  Copyright (c) 2015 Dan Hogan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        return flowLayout
        }())

    fileprivate(set) lazy var dataSource: DataSource = {
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
            self.collectionView.frame = self.view.frame

            return self.collectionView
            }())
        
        self.dataSource.registerReusableViews(self.collectionView)
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

