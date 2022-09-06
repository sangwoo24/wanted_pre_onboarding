//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet weak var weatherListCollectionView: UICollectionView!
    @IBOutlet weak var currentLocationSectionView: UIView!
    
    let viewModel: WeatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
}

extension WeatherListViewController {
    func setView() {
        
        // current location section
        currentLocationSectionView.layer.cornerRadius = 12
        
        // other location section
        weatherListCollectionView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        weatherListCollectionView.register(WeatherListCollectionViewCell.self, forCellWithReuseIdentifier: WeatherListCollectionViewCell.reuseIdentifier)
    }
}


extension WeatherListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherListCollectionViewCell.reuseIdentifier, for: indexPath) as? WeatherListCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.frame.width / 2 - 16
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

