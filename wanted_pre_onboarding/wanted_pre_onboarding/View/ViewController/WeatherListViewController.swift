//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet weak var weatherListCollectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let networkService = NetworkService.shared
    
    var weatherList: [WeatherResponse] = []
    
    private let cityCodeList: [Int] = [
        1842616,1841811,1842225,1842025,1835327,1835224,1841066,1838524,1835895,1835848,1836553,1835553,1835648,1833747,1843491,1845457,1846266,1845759,1845033,1845136]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getWeatherList()
    }
    
    func getWeatherList() {
        self.indicator.startAnimating()
        let group = DispatchGroup()
        
        for cityCode in cityCodeList {
            group.enter()
            networkService.getWeatherData(cityCode: cityCode) { response in
                if let weatherResponse = response {
                    self.weatherList.append(weatherResponse)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.indicator.stopAnimating()
            self.weatherListCollectionView.reloadData()
        }
    }
}

extension WeatherListViewController {
    func setView() {
        weatherListCollectionView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        weatherListCollectionView.register(WeatherListCollectionViewCell.self, forCellWithReuseIdentifier: WeatherListCollectionViewCell.reuseIdentifier)
        
        indicator.hidesWhenStopped = true
        view.bringSubviewToFront(indicator)
    }
}

extension WeatherListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherListCollectionViewCell.reuseIdentifier, for: indexPath) as? WeatherListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.updateCell(weatherList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as? WeatherDetailViewController else { return }

        vc.weatherDetail = WeatherDetail.fromWeatherResponse(weatherList[indexPath.item])
        vc.viewCompletionClosure = {
            // reload
            self.getWeatherList()
        }
        self.present(vc, animated: true, completion: nil)
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

