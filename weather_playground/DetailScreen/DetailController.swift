//
//  DetailViewController.swift
//  weather_playground
//
//  Created by Ozan Bas on 2.11.2021.
//

import UIKit



class DetailController: UIViewController {
    
    
    
    
    //MARK: - Properties
    
    
    let appLogoLabel : UILabel = {
        let label = UILabel()
        label.setDimensions(height: UIScreen.main.bounds.height / 18 , width: UIScreen.main.bounds.height / 4.5)
        label.layer.cornerRadius = UIScreen.main.bounds.height / 36
        label.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        label.text = "WeatherApp©"
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 40)
        label.textColor = .init(white: 1, alpha: 0.8)
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let mainCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        view.setHeight(UIScreen.main.bounds.height / 3)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let detailCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        view.setHeight(UIScreen.main.bounds.height / 5)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let hourlyCardView : UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        view.setHeight(UIScreen.main.bounds.height / 7)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let weatherImage : UIImageView = {
        let image = UIImageView()
        image.setDimensions(height: UIScreen.main.bounds.height / 7, width: UIScreen.main.bounds.width / 3)
        return image
    }()
   
    let cityNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 28)
        label.textAlignment = .center
        return label
    }()
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let feelsLikeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .init(white: 1, alpha: 0.8)
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 224)
        return label
    }()
    
    let tempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 28)
        return label
    }()
    
    let maxTempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)

        return label
    }()
    
    let minTempLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        return label
    }()
    
    let humidityLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        return label
    }()
    
    let humidityStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "humidity(%):"
        return label
    }()
    
    let pressureLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        return label
    }()
    
    let pressureStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "pressure(hPa):"
        return label
    }()
    
    let windDirectionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)

        return label
    }()
    
    let windDirectionStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "wind:"
        
        return label
    }()
    
    let windSpeedLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        return label
    }()
    
    let windSpeedStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "speed(Kn):"
        return label
    }()
    
    let cloudsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "no data"
        return label
    }()
    
    let cloudsStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "clouds(%):"
        return label
    }()
    
    let visibilityLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        return label
    }()
    
    let visibilityStaticLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 150)
        label.text = "visibility(m):"
        return label
    }()
    
    let hourLabel1 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage1 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp1 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
        return label
    }()
    
    let hourLabel2 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage2 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp2 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
        return label
    }()
    
    let hourLabel3 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage3 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp3 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
        return label
    }()
    
    let hourLabel4 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage4 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp4 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
        return label
    }()
    
    let hourLabel5 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage5 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp5 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
        return label
    }()
    
    let hourLabel6 : UILabel = {
        let label = UILabel()
        label.configureHourLabel()
        return label
    }()
    
    let hourImage6 : UIImageView = {
        let image = UIImageView()
        image.configureHourImage()
        return image
    }()
    
    let hourTemp6 : UILabel = {
        let label = UILabel()
        label.configureHourTemp()
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
        mainCardView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: UIScreen.main.bounds.height / 45, paddingLeft: UIScreen.main.bounds.height / 45, paddingRight: UIScreen.main.bounds.height / 45)
        

        
        view.addSubview(hourlyCardView)
        hourlyCardView.centerX(inView: view)
        hourlyCardView.anchor(top: mainCardView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: UIScreen.main.bounds.height / 45, paddingLeft: UIScreen.main.bounds.height / 45, paddingRight: UIScreen.main.bounds.height / 45)
        
        view.addSubview(detailCardView)
        detailCardView.centerX(inView: view)
        detailCardView.anchor(top: hourlyCardView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: UIScreen.main.bounds.height / 45, paddingLeft: UIScreen.main.bounds.height / 45, paddingRight: UIScreen.main.bounds.height / 45)
        
        mainCardView.addSubview(cityNameLabel)
        cityNameLabel.anchor(top: mainCardView.topAnchor, left: mainCardView.leftAnchor, paddingTop: UIScreen.main.bounds.height  / 30, paddingLeft: UIScreen.main.bounds.height / 30)
        
        mainCardView.addSubview(weatherImage)
        weatherImage.centerX(inView: mainCardView)
        weatherImage.anchor(top: mainCardView.topAnchor, paddingTop: UIScreen.main.bounds.height / 15)
        
        mainCardView.addSubview(tempLabel)
        tempLabel.centerX(inView: mainCardView)
        tempLabel.anchor(top: weatherImage.bottomAnchor, paddingTop: -10)
        
        mainCardView.addSubview(feelsLikeLabel)
        feelsLikeLabel.anchor(left: tempLabel.rightAnchor ,bottom: tempLabel.bottomAnchor)
        
        let tempsStackView = UIStackView(arrangedSubviews: [minTempLabel,maxTempLabel])
        tempsStackView.axis = .horizontal
        tempsStackView.distribution = .equalCentering
        
        view.addSubview(tempsStackView)
        tempsStackView.anchor(left: mainCardView.leftAnchor, bottom: mainCardView.bottomAnchor, right: mainCardView.rightAnchor, paddingLeft: 20, paddingBottom: UIScreen.main.bounds.height / 45 ,paddingRight: UIScreen.main.bounds.height / 45)
        
        let windStaticStackView = UIStackView(arrangedSubviews: [windDirectionStaticLabel,windSpeedStaticLabel,cloudsStaticLabel])
        windStaticStackView.axis = .vertical
        windStaticStackView.distribution = .equalCentering
        
        let miscStaticStackView = UIStackView(arrangedSubviews: [humidityStaticLabel,pressureStaticLabel,visibilityStaticLabel])
        miscStaticStackView.axis = .vertical
        miscStaticStackView.distribution = .equalCentering
        
        let windStackView = UIStackView(arrangedSubviews: [windDirectionLabel,windSpeedLabel,cloudsLabel])
        windStackView.axis = .vertical
        windStackView.distribution = .equalCentering
        
        let miscStackView = UIStackView(arrangedSubviews: [humidityLabel,pressureLabel,visibilityLabel])
        miscStackView.axis = .vertical
        miscStackView.distribution = .equalCentering
        
        let DetailStackView = UIStackView(arrangedSubviews: [miscStaticStackView,miscStackView, windStaticStackView,windStackView])
        DetailStackView.axis = .horizontal
        DetailStackView.distribution = .equalSpacing
        DetailStackView.spacing = 5
        
        detailCardView.addSubview(DetailStackView)
        DetailStackView.anchor(top: detailCardView.topAnchor, left: detailCardView.leftAnchor, bottom: detailCardView.bottomAnchor, right: detailCardView.rightAnchor, paddingTop: UIScreen.main.bounds.height / 45, paddingLeft: UIScreen.main.bounds.height / 45, paddingBottom: UIScreen.main.bounds.height / 45, paddingRight: UIScreen.main.bounds.height / 45)
        
        let hourly1StackView = UIStackView(arrangedSubviews: [hourLabel1,hourImage1,hourTemp1])
        hourly1StackView.axis = .vertical
        hourly1StackView.alignment = .center
        
        let hourly2StackView = UIStackView(arrangedSubviews: [hourLabel2,hourImage2,hourTemp2])
        hourly2StackView.axis = .vertical
        hourly2StackView.alignment = .center
        
        let hourly3StackView = UIStackView(arrangedSubviews: [hourLabel3,hourImage3,hourTemp3])
        hourly3StackView.axis = .vertical
        hourly3StackView.alignment = .center
        
        let hourly4StackView = UIStackView(arrangedSubviews: [hourLabel4,hourImage4,hourTemp4])
        hourly4StackView.axis = .vertical
        hourly4StackView.alignment = .center
        
        let hourly5StackView = UIStackView(arrangedSubviews: [hourLabel5,hourImage5,hourTemp5])
        hourly5StackView.axis = .vertical
        hourly5StackView.alignment = .center
        
        let hourly6StackView = UIStackView(arrangedSubviews: [hourLabel6,hourImage6,hourTemp6])
        hourly6StackView.axis = .vertical
        hourly6StackView.alignment = .center
        
        let hoursForecastStackView = UIStackView(arrangedSubviews: [hourly1StackView,hourly2StackView,hourly3StackView,hourly4StackView,hourly5StackView,hourly6StackView])
        hoursForecastStackView.axis = .horizontal
        hoursForecastStackView.distribution = .fillEqually
        hourlyCardView.addSubview(hoursForecastStackView)
        hoursForecastStackView.anchor(top: hourlyCardView.topAnchor, left: hourlyCardView.leftAnchor, bottom: hourlyCardView.bottomAnchor, right: hourlyCardView.rightAnchor, paddingTop: UIScreen.main.bounds.height / 45, paddingLeft: UIScreen.main.bounds.height / 45, paddingBottom: UIScreen.main.bounds.height / 45, paddingRight: UIScreen.main.bounds.height / 45)
        view.addSubview(appLogoLabel)
        appLogoLabel.centerX(inView: view)
        appLogoLabel.anchor(top: detailCardView.bottomAnchor, paddingTop: 15)
        
    }
}
