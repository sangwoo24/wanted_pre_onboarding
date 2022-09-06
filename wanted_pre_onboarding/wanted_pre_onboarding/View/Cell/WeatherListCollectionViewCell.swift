//
//  WeatherListCollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import UIKit

class WeatherListCollectionViewCell: UICollectionViewCell {
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage()
        
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        
        contentView.addSubview(tempLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(icon)
        contentView.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            humidityLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 4),
            humidityLabel.leadingAnchor.constraint(equalTo: tempLabel.leadingAnchor),
            
            icon.topAnchor.constraint(equalTo: tempLabel.topAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            icon.widthAnchor.constraint(equalToConstant: 40),
            icon.heightAnchor.constraint(equalToConstant: 40),
            
            locationLabel.widthAnchor.constraint(equalToConstant: 100),
            locationLabel.leadingAnchor.constraint(equalTo: tempLabel.leadingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateCell(_ weatherResponse: WeatherResponse) {
        tempLabel.text = "\(Int(round(weatherResponse.main.temp)))°"
        humidityLabel.text = "\(weatherResponse.main.humidity)%"
        if let weather = weatherResponse.weather.first {
            icon.setNetworkImage("https://openweathermap.org/img/wn/\(weather.icon)@2x.png")
        }
        locationLabel.text = weatherResponse.name
    }
}
