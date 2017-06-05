//
//  CollectionViewCell.swift
//  ParallaxCollectionView
//
//  Created by Patrick Hogan on 5/24/15.
//  Copyright (c) 2015 Dan Hogan. All rights reserved.
//

import UIKit

let kImageViewHeightDelta: CGFloat = 55.0

protocol CollectionViewCellDelegate: class {
    func collectionViewCell(collectionViewCellDidLayoutSubViews collectionViewCell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CollectionViewCellDelegate?
    
    let containerView = UIView(frame: CGRect.zero)
    let imageView = UIImageView(frame: CGRect.zero)
    
    var imageViewNormalizedYOffset: CGFloat = 0.5 {
        didSet {
            layoutImageView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview({
            self.containerView.frame = self.contentView.frame
            self.containerView.clipsToBounds = true
            self.containerView.addSubview({
                self.imageView.contentMode = .scaleAspectFill
                self.imageView.clipsToBounds = true
                self.imageView.frame = self.containerView.frame

                return self.imageView
                }())
            

            return self.containerView
            }())
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutImageView() {
        imageView.frame = CGRect(
            x: 0.0,
            y: -imageViewNormalizedYOffset * kImageViewHeightDelta,
            width: containerView.frame.width,
            height: containerView.frame.size.height + kImageViewHeightDelta
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView.frame.size.height != containerView.frame.size.height + kImageViewHeightDelta {
            layoutImageView()
        }
        
        delegate?.collectionViewCell(collectionViewCellDidLayoutSubViews: self)
    }

}
