//
//  ImageCollectionViewCell.swift
//  instacat
//
//  Created by Piero Rado on 11/21/19.
//  Copyright © 2019 Piero Rado. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}

