//
//  DetailViewController.swift
//  weather_playground
//
//  Created by Ozan Bas on 2.11.2021.
//

import UIKit



class DetailController: UIViewController {
    
    
    //MARK: - Properties
    
    let mainCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setHeight(330)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let detailCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setHeight(165)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let hourlyCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setHeight(175)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let weatherImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .darkGray
        image.setDimensions(height: 120, width: 120)
        return image
    }()
   
    let cityNameLabel : UILabel = {
        let label = UILabel()
        label.text = "asdasd"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        return label
    }()
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .init(white: 1, alpha: 0.0)
        return image
    }()
    
    let feelsLikeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.text = "Feels like: 11"
        label.backgroundColor = .darkGray

        return label
    }()
    
    let tempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 32)
        label.text = "12"
        label.backgroundColor = .darkGray

        return label
    }()
    
    let maxTempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.text = "High: 9"
        label.backgroundColor = .darkGray

        return label
    }()
    
    let minTempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.text = "Low: 9"
        label.backgroundColor = .darkGray

        return label
    }()
    
    let humidityLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.text = "Humidity: 80"
        label.backgroundColor = .darkGray
        return label
    }()
    
    let pressureLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .darkGray
        label.text = "Pressure : 1020"
        return label
    }()
    
    let windDirectionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .darkGray
        label.text = "Direction : SE"

        return label
    }()
    
    let windSpeedLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .darkGray
        label.text = "WindSpeed: 8.5"

        return label
    }()
    
    let windGustLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .darkGray
        label.text = "Gust : 8.5"

        return label
    }()
    
    let visibilityLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .darkGray
        label.text = "Pressure : 1020"

        return label
    }()
    
    
    //MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    
    //MARK: - Helpers
    
    func configureUI() {
       
        
        view.addSubview(backgroundImage)
        backgroundImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(mainCardView)
        mainCardView.centerX(inView: view)
        mainCardView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        view.addSubview(detailCardView)
        detailCardView.centerX(inView: view)
        detailCardView.anchor(top: mainCardView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        view.addSubview(hourlyCardView)
        hourlyCardView.centerX(inView: view)
        hourlyCardView.anchor(top: detailCardView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        mainCardView.addSubview(cityNameLabel)
        cityNameLabel.anchor(top: mainCardView.topAnchor, left: mainCardView.leftAnchor, paddingTop: 30, paddingLeft: 30)
        
        mainCardView.addSubview(weatherImage)
        weatherImage.centerX(inView: mainCardView)
        weatherImage.anchor(top: mainCardView.topAnchor, paddingTop: 90)
        
        mainCardView.addSubview(tempLabel)
        tempLabel.centerX(inView: mainCardView)
        tempLabel.anchor(top: weatherImage.bottomAnchor, paddingTop: 10)
        
        let tempsStackView = UIStackView(arrangedSubviews: [feelsLikeLabel,maxTempLabel,minTempLabel])
        tempsStackView.axis = .horizontal
        tempsStackView.distribution = .equalCentering
        
        view.addSubview(tempsStackView)
        tempsStackView.anchor(top: tempLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
        let windStackView = UIStackView(arrangedSubviews: [windDirectionLabel,windSpeedLabel,windGustLabel])
        windStackView.axis = .vertical
        windStackView.distribution = .equalCentering
        
        let miscStackView = UIStackView(arrangedSubviews: [humidityLabel,pressureLabel,visibilityLabel])
        miscStackView.axis = .vertical
        miscStackView.distribution = .equalCentering
        
        let DetailStackView = UIStackView(arrangedSubviews: [miscStackView, windStackView])
        DetailStackView.axis = .horizontal
        DetailStackView.distribution = .equalSpacing
        
        detailCardView.addSubview(DetailStackView)
        DetailStackView.anchor(top: detailCardView.topAnchor, left: detailCardView.leftAnchor, bottom: detailCardView.bottomAnchor, right: detailCardView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        

    }
}
