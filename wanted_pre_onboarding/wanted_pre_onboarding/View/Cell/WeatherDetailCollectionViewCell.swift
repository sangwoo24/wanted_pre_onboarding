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
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    let detailInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(icon)
        addSubview(valueLabel)
        addSubview(detailInfoLabel)
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            icon.widthAnchor.constraint(equalToConstant: 10),
            icon.heightAnchor.constraint(equalToConstant: 10),
            
            valueLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            valueLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            
            detailInfoLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 10),
            detailInfoLabel.centerXAnchor.constraint(equalTo: valueLabel.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateCell(_ measurement: Measurement) {
        
        valueLabel.text = measurement.type.getValueString(measurement.value)
        detailInfoLabel.text = measurement.type.getDetailInfo()
    }
}
