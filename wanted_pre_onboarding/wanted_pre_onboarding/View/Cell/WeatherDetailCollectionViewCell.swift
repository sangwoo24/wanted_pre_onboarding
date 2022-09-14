//
//  WeatherDetailCollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/14.
//

import UIKit

class WeatherDetailCollectionViewCell: UICollectionViewCell {
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage()
        
        return imageView
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white

        addSubview(icon)
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 24),
            icon.heightAnchor.constraint(equalToConstant: 24),
            
            valueLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            valueLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateCell(_ measurement: Measurement) {
        icon.image = UIImage(named: measurement.type.getTypeIconName())
        valueLabel.text = measurement.type.getValueString(measurement.value)
    }
}
