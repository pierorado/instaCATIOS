//
//  CustomImageFlowLayout.swift
//  instacat
//
//  Created by Piero Rado on 11/21/19.
//  Copyright © 2019 Piero Rado. All rights reserved.
//

import UIKit

class CustomImageFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set{
            
        }
        get{
            let numberOfColums: CGFloat = 3
            let itemWidth = (self.collectionView!.frame.width - (numberOfColums - 1)) / numberOfColums
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
        
        
    }
}
