//
//  MainController.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit
import CoreLocation



class MainController: UIViewController {

    //MARK: - Properties
    
    
    
    
    var mainDelegate: MainScreenProtocol?
    var detailsDelegate: DetailsScreenProtocol?
    var locationManager = CLLocationManager()
    var deviceLat : String?
    var deviceLon : String?
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let appLogoLabel : UILabel = {
        let label = UILabel()
        label.setDimensions(height: 50, width: 200)
        label.layer.cornerRadius = 25
        label.backgroundColor = .init(white: 1, alpha: 0.2)
        label.text = "WeatherApp©"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .init(white: 1, alpha: 0.8)
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()

    let currentViewCard : UIView = {
        let view = UIView()
        view.setHeight(180)
        view.backgroundColor = .init(white: 1, alpha: 0.1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let forecastViewCard : UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 1, alpha: 0.1)
        view.layer.cornerRadius = 10
        view.setHeight(320)
        return view
    }()
    
    
    let requestTextField : UITextField = {
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
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label = UILabel()
         label.font = .boldSystemFont(ofSize: 36)
         label.textColor = .white
         label.setDimensions(height: 50, width: 120)
         label.textAlignment = .center
         return label
    }()
    
    let weatherImage : UIImageView = {
        let image = UIImageView()
        image.setDimensions(height: 100, width: 100)
        image.layer.cornerRadius = 80 / 2
        image.tintColor = .white
        return image
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .init(white: 1, alpha: 0.7)
        label.setDimensions(height: 60, width: 130)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
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
            button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        return button
    }()

    let currentCardButton : UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(currentCardButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    let firstDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let secondDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let thirdDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let fourthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let fifthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let sixthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let seventhDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let firstDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let secondDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let thirdDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let fourthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let fifthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let sixthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let seventhDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let firstMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let secondMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let thirdMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let fourthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let fifthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let sixthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let seventhMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let firstMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let secondMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let thirdMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let fourthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let fifthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let sixthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let seventhMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
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
        
    //MARK: - Actions
    
    @objc func locationButtonTapped() {
        mainDelegate?.firstTimeLocationUpdate(lat: deviceLat ?? "", Lon: deviceLon ?? "")
    }

    @objc func currentCardButtonTapped() {
        print("DEBUG: Button Tapped.")
        detailsDelegate?.userDidAskForDetails()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        requestTextField.endEditing(true)
    }
    
    
    //MARK: - Helpers
    

    func configureUI() {
        
        let gradient = CAGradientLayer()

        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        requestTextField.delegate = self
        
        view.addSubview(backgroundImage)
        backgroundImage.frame = view.frame
        backgroundImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(locationButton)
        locationButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingRight: 22)
        
        view.addSubview(requestTextField)
        requestTextField.centerX(inView: view)
        requestTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: locationButton.leftAnchor,
        paddingTop: 40, paddingLeft: 30, paddingRight: 10)
        
        view.addSubview(currentViewCard)
        currentViewCard.centerX(inView: view)
        currentViewCard.anchor(top: requestTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 32, paddingLeft: 22, paddingRight: 22)

        view.addSubview(forecastViewCard)
        forecastViewCard.centerX(inView: view)
        forecastViewCard.anchor(top: currentViewCard.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 22, paddingRight: 22)
        
        
        currentViewCard.addSubview(cityNameLabel)
        cityNameLabel.anchor(top:currentViewCard.topAnchor, left: currentViewCard.leftAnchor, paddingTop: 22 ,paddingLeft: 22)
        
        currentViewCard.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: currentViewCard.topAnchor, right: currentViewCard.rightAnchor, paddingTop: 22, paddingRight: 10)
        
        
        currentViewCard.addSubview(weatherImage)
        weatherImage.anchor(bottom: currentViewCard.bottomAnchor, right: currentViewCard.rightAnchor ,paddingBottom: 10, paddingRight: 22)
        
        currentViewCard.addSubview(descriptionLabel)
        descriptionLabel.anchor(left: currentViewCard.leftAnchor, bottom: currentViewCard.bottomAnchor, right: weatherImage.leftAnchor, paddingLeft: 24, paddingBottom: 32, paddingRight: 10)
        
        currentViewCard.addSubview(currentCardButton)
        currentCardButton.anchor(top:currentViewCard.topAnchor, left: currentViewCard.leftAnchor,
                                 bottom: currentViewCard.bottomAnchor, right: currentViewCard.rightAnchor)
        
                
        let firstDayStackView = UIStackView(arrangedSubviews: [firstDayLabel,firstDayImage,firstMaxTempLabel,firstMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let secondDayStackView = UIStackView(arrangedSubviews: [secondDayLabel,secondDayImage,secondMaxTempLabel,secondMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let thirdDayStackView = UIStackView(arrangedSubviews: [thirdDayLabel,thirdDayImage,thirdMaxTempLabel,thirdMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let fourthDayStackView = UIStackView(arrangedSubviews: [fourthDayLabel,fourthDayImage,fourthMaxTempLabel,fourthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let fifthDayStackView = UIStackView(arrangedSubviews: [fifthDayLabel,fifthDayImage,fifthMaxTempLabel,fifthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let sixthDayStackView = UIStackView(arrangedSubviews: [sixthDayLabel,sixthDayImage,sixthMaxTempLabel,sixthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let seventhDayStackView = UIStackView(arrangedSubviews: [seventhDayLabel,seventhDayImage,seventhMaxTempLabel,seventhMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let forecastStackView = UIStackView(arrangedSubviews: [firstDayStackView,secondDayStackView,thirdDayStackView,fourthDayStackView,fifthDayStackView,sixthDayStackView,seventhDayStackView])
        forecastStackView.axis = .vertical
        forecastStackView.distribution = .fillEqually
        

        
        forecastViewCard.addSubview(forecastStackView)
        forecastStackView.anchor(top: forecastViewCard.topAnchor, left: forecastViewCard.leftAnchor, bottom: forecastViewCard.bottomAnchor, right: forecastViewCard.rightAnchor, paddingTop: 15, paddingLeft: 20, paddingBottom: 15, paddingRight: 20)
        
        
        
        view.addSubview(appLogoLabel)
        appLogoLabel.centerX(inView: view)
        appLogoLabel.anchor(top:forecastViewCard.bottomAnchor, paddingTop: 20)
    }
    
    

}

//MARK: - Extensions

extension MainController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return requestTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
                
        guard let userText = requestTextField.text?.lowercased() else { return }
        
        let cityName = userText.replacingOccurrences(of: " ", with: "-")
        
        print("DEBUG: cityName: \(cityName)")
        mainDelegate?.userDidAskForData(for: cityName)
        requestTextField.text = ""
    }
}

extension MainController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            deviceLat = String(latitude)
            deviceLon = String(longitude)
            
            print("\(deviceLat ?? ""), \(deviceLon ?? "")")
            mainDelegate?.firstTimeLocationUpdate(lat: deviceLat ?? "", Lon: deviceLon ?? "")
            
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: Location fetch failed. -> \(error.localizedDescription)")
    }
}
