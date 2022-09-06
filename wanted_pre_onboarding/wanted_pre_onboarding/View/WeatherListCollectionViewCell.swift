//
//  WeatherListCollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import UIKit

class WeatherListCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // init
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
