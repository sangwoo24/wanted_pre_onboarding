//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/14.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDetailCollectionView: UICollectionView!
    
    var weatherDetail: WeatherDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func pop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setView() {
        weatherDetailCollectionView.register(WeatherDetailCollectionViewCell.self, forCellWithReuseIdentifier: WeatherDetailCollectionViewCell.reuseIdentifier)
        
        icon.setNetworkImage(weatherDetail.iconUrl)
        descriptionLabel.text = weatherDetail.description
        locationLabel.text = weatherDetail.location
        tempLabel.text = "\(Int(round(weatherDetail.currentTemp)))°C"
    }
}

extension WeatherDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // enum type 으로 넘김
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailCollectionViewCell.reuseIdentifier, for: indexPath) as? WeatherDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.updateCell(weatherDetail.mesurements[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let width: CGFloat = collectionView.frame.width / 4 - 100
        
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
