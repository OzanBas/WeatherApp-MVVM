//
//  MainController.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit
import CoreLocation



protocol MainControllerProtocol {
    func userDidAskForData(for cityName: String)
}


class MainController: UIViewController {

    //MARK: - Properties
    
    
    var delegate: MainControllerProtocol?
    var locationManager = CLLocationManager()
    
    
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        return image
    }()

    let currentWeatherView : UIView = {
        let view = UIView()
        view.setHeight(180)
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let forecastWeatherView : UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        view.setHeight(320)
        return view
    }()
    
    
    let requestField : UITextField = {
       let field = UITextField()
        field.borderStyle = .roundedRect
        field.returnKeyType = .go
        field.backgroundColor = .white
        field.setHeight(50)
        field.placeholder = " Search City or State"
        return field
    }()
    
    let cityNameLabel : UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.setDimensions(height: 50, width: 150)
        label.text = "Location"
        label.textAlignment = .left
        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label = UILabel()
         label.font = .boldSystemFont(ofSize: 36)
         label.textColor = .white
         label.setDimensions(height: 50, width: 120)
         label.text = "Temperature"
         label.textAlignment = .center
         return label
    }()
    
    let weatherImage : UIImageView = {
        let image = UIImageView()
        image.setDimensions(height: 100, width: 100)
        image.layer.cornerRadius = 80 / 2
        image.tintColor = .white
        image.image = UIImage(systemName: "square.and.arrow.down")
        
        return image
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .init(white: 1, alpha: 0.7)
        label.setDimensions(height: 60, width: 130)
        label.text = "Description"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let locationButton : UIButton = {
        let button = UIButton(type: .system)
        button.setDimensions(height: 50, width: 50)
        button.layer.cornerRadius = 50 / 2
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.imageView?.setDimensions(height: 35, width: 40)
        return button
    }()

    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let thirdLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let fourthLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let fifthLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let sixthLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let seventhLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "Label")
        return label
    }()
    
    let firstImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let secondImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let thirdImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let fourthImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let fifthImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let sixthImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let seventhImage : UIImageView = {
        let image = UIImageView()
        image.configureDayImage()
        return image
    }()
    
    let firstTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let secondTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let thirdTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let fourthTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let fifthTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let sixthTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    let seventhTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "0")
        return label
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            print("TRUE")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
        }
        
        configureUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
        
    

    
    //MARK: - Helpers
    

    
    func configureUI() {
        
        let gradient = CAGradientLayer()

        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        requestField.delegate = self
        
        view.addSubview(backgroundImage)
        backgroundImage.frame = view.frame
        backgroundImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(locationButton)
        locationButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingRight: 22)
        
        view.addSubview(requestField)
        requestField.centerX(inView: view)
        requestField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: locationButton.leftAnchor,
        paddingTop: 40, paddingLeft: 30, paddingRight: 10)
        
        view.addSubview(currentWeatherView)
        currentWeatherView.centerX(inView: view)
        currentWeatherView.anchor(top: requestField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 22, paddingRight: 22)

        view.addSubview(forecastWeatherView)
        forecastWeatherView.centerX(inView: view)
        forecastWeatherView.anchor(top: currentWeatherView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 22, paddingLeft: 22, paddingRight: 22)
        
        
        currentWeatherView.addSubview(cityNameLabel)
        cityNameLabel.anchor(top:currentWeatherView.topAnchor, left: currentWeatherView.leftAnchor, paddingTop: 22 ,paddingLeft: 22)
        
        currentWeatherView.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: currentWeatherView.topAnchor, right: currentWeatherView.rightAnchor, paddingTop: 22, paddingRight: 10)
        
        
        currentWeatherView.addSubview(weatherImage)
        weatherImage.anchor(bottom: currentWeatherView.bottomAnchor, right: currentWeatherView.rightAnchor ,paddingBottom: 10, paddingRight: 22)
        
        currentWeatherView.addSubview(descriptionLabel)
        descriptionLabel.anchor(left: currentWeatherView.leftAnchor, bottom: currentWeatherView.bottomAnchor, right: weatherImage.leftAnchor, paddingLeft: 24, paddingBottom: 32, paddingRight: 10)
        
        let daysStackView = UIStackView(arrangedSubviews: [firstLabel,secondLabel,thirdLabel,fourthLabel,fifthLabel,sixthLabel,seventhLabel])
        daysStackView.distribution = .equalCentering
        daysStackView.axis = .vertical
        daysStackView.spacing = 10
        daysStackView.setWidth(120)
        
        let imagesStackView = UIStackView(arrangedSubviews: [firstImage,secondImage,thirdImage,fourthImage,fifthImage,sixthImage,seventhImage])
        imagesStackView.distribution = .equalCentering
        imagesStackView.axis = .vertical
        imagesStackView.spacing = 10
        imagesStackView.setWidth(50)
        
        let tempStackView = UIStackView(arrangedSubviews: [firstTempLabel,secondTempLabel,thirdTempLabel,fourthTempLabel,fifthTempLabel,sixthTempLabel,seventhTempLabel])
        tempStackView.distribution = .equalCentering
        tempStackView.axis = .vertical
        tempStackView.spacing = 10
        tempStackView.setWidth(50)

        let infoStackView = UIStackView(arrangedSubviews: [imagesStackView, tempStackView])
        infoStackView.spacing = 20
        infoStackView.axis = .horizontal
        infoStackView.distribution = .equalCentering
        
        forecastWeatherView.addSubview(daysStackView)
        daysStackView.anchor(top: forecastWeatherView.topAnchor, left: forecastWeatherView.leftAnchor, bottom: forecastWeatherView.bottomAnchor,paddingTop: 15,paddingLeft: 20,paddingBottom: 15)
        
        forecastWeatherView.addSubview(infoStackView)
        infoStackView.anchor(top: forecastWeatherView.topAnchor, bottom: forecastWeatherView.bottomAnchor,
                             right: forecastWeatherView.rightAnchor, paddingTop: 15, paddingBottom: 15, paddingRight: 20)
        
        
        
        
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        requestField.endEditing(true)
    }
}

//MARK: - Extensions

extension MainController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return requestField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
                
        guard let userText = requestField.text?.lowercased() else { return }
        
        let cityName = userText.replacingOccurrences(of: " ", with: "-")
        
        print("DEBUG: cityName: \(cityName)")
        delegate?.userDidAskForData(for: cityName)
        requestField.text = ""
    }
}

extension MainController: CLLocationManagerDelegate {
        
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("\(latitude), \(longitude)")
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: Location fetch failed. -> \(error.localizedDescription)")
    }
}
